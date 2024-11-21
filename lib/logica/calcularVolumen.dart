class CalcularVolumen {

  double calcularVolumenCilindro(double radio, double altura) {
    // La fórmula para calcular el volumen de un cilindro es: V = π(3.1416) * r^2 * h
    double volumen = 3.1416 * radio * radio * altura;

    return volumen;
  }
}