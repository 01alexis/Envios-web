package com.distribuida.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
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
        List<Envios> envios = enviosDAO.findAll();
        modelMap.addAttribute("envios", envios);
        return "listar-envios";
    }

    @GetMapping("/findOne")
    public String findOne(@RequestParam(value = "idEnvios", required = false) Integer idEnvios,
                          @RequestParam(value = "opcion", required = false) Integer opcion, 
                          ModelMap modelMap) {
        if (idEnvios != null) {
            Envios envios = enviosDAO.findOne(idEnvios);
            modelMap.addAttribute("envios", envios);
        }
        if (opcion == null || opcion == 1) {
            return "add-envios";
        } else {
            return "del-envios";
        }
    }

    @PostMapping("/add")
    public String add(@RequestParam("idEnvios") @Nullable Integer idEnvios,
                      @RequestParam("fechaEnvio") @Nullable String fechaEnvio,
                      @RequestParam("idPedido") @Nullable Integer idPedido,
                      @RequestParam("idSucursalOrigen") @Nullable Integer idSucursalOrigen,
                      @RequestParam("idSucursalDestino") @Nullable Integer idSucursalDestino) {

        LocalDate fecha;
        try {
            fecha = LocalDate.parse(fechaEnvio);
        } catch (DateTimeParseException e) {
            // Manejar formato de fecha inválido
            return "error";
        }
        Date fechaSql = java.sql.Date.valueOf(fecha);

        if (idEnvios == null) {
            Envios envios = new Envios(0, fechaSql, idPedido, idSucursalOrigen, idSucursalDestino);
            enviosDAO.add(envios);
        } else {
            Envios envios = new Envios(idEnvios, fechaSql, idPedido, idSucursalOrigen, idSucursalDestino);
            enviosDAO.up(envios);
        }
        return "redirect:/envios/findAll";
    }

    @GetMapping("/del")
    public String del(@RequestParam("idEnvios") @Nullable Integer idEnvios) {
        if (idEnvios != null) {
            enviosDAO.del(idEnvios);
        }
        return "redirect:/envios/findAll";
    }
}