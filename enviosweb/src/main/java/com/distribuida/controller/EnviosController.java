package com.distribuida.controller;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.distribuida.dao.EnviosDAO;
import com.distribuida.entities.Envios;

@Controller
@RequestMapping("/envios")
public class EnviosController {

    @Autowired
    private EnviosDAO enviosDAO;

    @GetMapping("/findAll")
    public String findAll(ModelMap modelMap) {
        //try {
            List<Envios> envios = enviosDAO.findAll();
            modelMap.addAttribute("envios", envios);
        //} catch (Exception e) {
          //  modelMap.addAttribute("error", "No se pudieron cargar los envíos: " + e.getMessage());
        //}
        return "listar-envios"; 
    }

    @GetMapping("/findOne")
    public String findOne(@RequestParam(value = "idEnvios", required = false) Integer idEnvio, ModelMap modelMap) {
        if (idEnvio != null) {
            try {
                Envios envio = enviosDAO.findOne(idEnvio);
                modelMap.addAttribute("envio", envio);
            } catch (Exception e) {
                modelMap.addAttribute("error", "No se pudo encontrar el envío: " + e.getMessage());
            }
        }
        return "ver-envio"; 
    }

    @PostMapping("/add")
    @Transactional
    public String add(@RequestParam(value = "idEnvio", required = false) Integer idEnvio,
                      @RequestParam(value = "fechaEnvio", required = false) Date fechaEnvio,
                      @RequestParam("idPedido") int idPedido,
                      @RequestParam("idSucursalOrigen") int idSucursalOrigen,
                      @RequestParam("idSucursalDestino") int idSucursalDestino,
                      ModelMap modelMap) {
        
        try {
            Envios envio;
            if (idEnvio == null) {
                envio = new Envios();
                envio.setFechaEnvio(fechaEnvio);
                envio.setIdPedido(idPedido);
                envio.setIdSucursalOrigen(idSucursalOrigen);
                envio.setIdSucursalDestino(idSucursalDestino);
                enviosDAO.add(envio);
            } else {
                envio = enviosDAO.findOne(idEnvio);
                if (envio != null) {
                    envio.setFechaEnvio(fechaEnvio);
                    envio.setIdPedido(idPedido);
                    envio.setIdSucursalOrigen(idSucursalOrigen);
                    envio.setIdSucursalDestino(idSucursalDestino);
                    enviosDAO.up(envio);
                }
            }
        } catch (Exception e) {
            modelMap.addAttribute("error", "Error al guardar el envío: " + e.getMessage());
        }

        return "redirect:/envios/findAll"; 
    }

    @GetMapping("/del")
    public String del(@RequestParam(value = "idEnvio") Integer idEnvio) {
        if (idEnvio != null) {
            try {
                enviosDAO.del(idEnvio);
            } catch (Exception e) {
                
            }
        }
        return "redirect:/envios/findAll"; 
    }
}

