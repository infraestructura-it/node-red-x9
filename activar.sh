read -p "👉 ¿Querés habilitar el modo 'proyectos' en settings.js? [s/N]: " habilitar_proyectos
if [[ "$habilitar_proyectos" =~ ^[sS]$ ]]; then
  echo "🛠 Configurando Node-RED para habilitar modo 'proyectos'..."

  SETTINGS_FILE="$HOME/.node-red/settings.js"
  LINEA_OBJETIVO=423

  if [[ -f "$SETTINGS_FILE" ]]; then
    # Verificamos si la línea 423 contiene 'enabled: false'
    if sed -n "${LINEA_OBJETIVO}p" "$SETTINGS_FILE" | grep -q "enabled: false"; then
      sed -i "${LINEA_OBJETIVO}s/enabled: false/enabled: true/" "$SETTINGS_FILE"
      echo "✅ Línea $LINEA_OBJETIVO modificada: 'enabled: true'."
    else
      echo "⚠️ La línea $LINEA_OBJETIVO no contiene 'enabled: false'. No se modificó."
    fi
  else
    echo "❌ settings.js no encontrado en ~/.node-red"
    echo "🔁 Iniciá Node-RED al menos una vez para generar la configuración inicial."
  fi
else
  echo "❌ No se modificará settings.js."
fi

echo "✅ Proceso finalizado. Ejecutá 'node-red' para iniciar si lo instalaste."

