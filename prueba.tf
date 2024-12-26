# Definimos la variable para la clave pública
variable "public_key" {
  description = "La clave pública SSH"
  type        = string
}

# Recurso (aunque no estamos creando nada, solo vamos a imprimir la clave pública)
output "public_key_output" {
  value = var.public_key
}
