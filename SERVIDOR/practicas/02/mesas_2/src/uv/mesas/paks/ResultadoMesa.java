package uv.mesas.paks;

public class ResultadoMesa {
   private int distrito;
   private int seccion;
   private char mesa;
   private String colegio;
   private int electores;
   private int votosEfectuados;
   private double porcParticipacion;
   private int votosEfectivos;
   private double porcEfectivos;
   private int votosBlancos;
   private double porcBlancos;
   private int votosNulos;
   private double porcNulos;

   public ResultadoMesa(String line) {
      String[] tokens = line.split(";");
      distrito = Integer.parseInt(tokens[0]);
      seccion = Integer.parseInt(tokens[1]);
      mesa = tokens[2].charAt(0);
      colegio = tokens[3];
      electores = Integer.parseInt(tokens[4]);
      votosEfectuados = Integer.parseInt(tokens[5]);
      porcParticipacion = Double.parseDouble(tokens[6]);
      votosEfectivos = Integer.parseInt(tokens[7]);
      porcEfectivos = Double.parseDouble(tokens[8]);
      votosBlancos = Integer.parseInt(tokens[9]);
      porcBlancos = Double.parseDouble(tokens[10]);
      votosNulos = Integer.parseInt(tokens[11]);
      porcNulos = Double.parseDouble(tokens[12]);
   }

   public ResultadoMesa() {};

   public ResultadoMesa(int distrito, int seccion, char mesa, String colegio,
                        int electores, int votosEfectuados, double porcParticipacion,
                        int votosEfectivos, double porcEfectivos, int votosBlancos,
                        double porcBlancos, int votosNulos, double porcNulos) {
      super();
      this.distrito = distrito;
      this.seccion = seccion;
      this.mesa = mesa;
      this.colegio = colegio;
      this.electores = electores;
      this.votosEfectuados = votosEfectuados;
      this.porcParticipacion = porcParticipacion;
      this.votosEfectivos = votosEfectivos;
      this.porcEfectivos = porcEfectivos;
      this.votosBlancos = votosBlancos;
      this.porcBlancos = porcBlancos;
      this.votosNulos = votosNulos;
      this.porcNulos = porcNulos;
   }


   public String toHTMLTableRow() {
      StringBuilder sb = new StringBuilder();
      sb.append("<tr><td> ");
      sb.append(distrito);
      sb.append("</td><td>");
      sb.append(seccion);
      sb.append("</td><td>");
      sb.append(mesa);
      sb.append("</td><td>");
      sb.append(colegio);
      sb.append("</td><td>");
      sb.append(electores);
      sb.append("</td><td>");
      sb.append(votosEfectuados);
      sb.append("</td><td>");
      sb.append(porcParticipacion);
      sb.append("</td><td>");
      sb.append(votosEfectivos);
      sb.append("</td><td>");
      sb.append(porcEfectivos);
      sb.append("</td><td>");
      sb.append(votosBlancos);
      sb.append("</td><td>");
      sb.append(porcBlancos);
      sb.append("</td><td>");
      sb.append(votosNulos);
      sb.append("</td><td>");
      sb.append(porcNulos);
      sb.append("</td></tr>");
      return sb.toString();
   }

   @Override
   public String toString() {
      StringBuilder sb = new StringBuilder();
      sb.append("Distrito: ");
      sb.append(distrito);
      sb.append(", seccion: ");
      sb.append(seccion);
      sb.append(", mesa: ");
      sb.append(mesa);
      sb.append(", colegio: ");
      sb.append(colegio);
      sb.append(", electores: ");
      sb.append(electores);
      sb.append(", votosEfectuados: ");
      sb.append(votosEfectuados);
      sb.append(", porcParticipacion: ");
      sb.append(porcParticipacion);
      sb.append(", votosEfectivos: ");
      sb.append(votosEfectivos);
      sb.append(", porcEfectivos: ");
      sb.append(porcEfectivos);
      sb.append(", votosBlancos: ");
      sb.append(votosBlancos);
      sb.append(", porcBlancos: ");
      sb.append(porcBlancos);
      sb.append(", votosNulos: ");
      sb.append(votosNulos);
      sb.append(", porcNulos: ");
      sb.append(porcNulos);
      sb.append("\n");
      return sb.toString();
   }

   public String toTokens(char tokenDelim) {
      StringBuilder sb = new StringBuilder();
      sb.append(distrito);
      sb.append(tokenDelim);

      sb.append(seccion);
      sb.append(tokenDelim);

      sb.append(mesa);
      sb.append(tokenDelim);

      sb.append(colegio);
      sb.append(tokenDelim);

      sb.append(electores);
      sb.append(tokenDelim);

      sb.append(votosEfectuados);
      sb.append(tokenDelim);

      sb.append(porcParticipacion);
      sb.append(tokenDelim);

      sb.append(votosEfectivos);
      sb.append(tokenDelim);

      sb.append(porcEfectivos);
      sb.append(tokenDelim);

      sb.append(votosBlancos);
      sb.append(tokenDelim);

      sb.append(porcBlancos);
      sb.append(tokenDelim);

      sb.append(votosNulos);
      sb.append(tokenDelim);

      sb.append(porcNulos);
      sb.append(tokenDelim);

      return sb.toString();
   }


   public int getDistrito() {
      return distrito;
   }

   public void setDistrito(int distrito) {
      this.distrito = distrito;
   }

   public int getSeccion() {
      return seccion;
   }

   public void setSeccion(int seccion) {
      this.seccion = seccion;
   }

   public char getMesa() {
      return mesa;
   }

   public void setMesa(char mesa) {
      this.mesa = mesa;
   }

   public String getColegio() {
      return colegio;
   }

   public void setColegio(String colegio) {
      this.colegio = colegio;
   }

   public int getElectores() {
      return electores;
   }

   public void setElectores(int electores) {
      this.electores = electores;
   }

   public int getVotosEfectuados() {
      return votosEfectuados;
   }

   public void setVotosEfectuados(int votosEfectuados) {
      this.votosEfectuados = votosEfectuados;
   }

   public double getPorcParticipacion() {
      return porcParticipacion;
   }

   public void setPorcParticipacion(double porcParticipacion) {
      this.porcParticipacion = porcParticipacion;
   }

   public int getVotosEfectivos() {
      return votosEfectivos;
   }

   public void setVotosEfectivos(int votosEfectivos) {
      this.votosEfectivos = votosEfectivos;
   }

   public double getPorcEfectivos() {
      return porcEfectivos;
   }

   public void setPorcEfectivos(double porcEfectivos) {
      this.porcEfectivos = porcEfectivos;
   }

   public int getVotosBlancos() {
      return votosBlancos;
   }

   public void setVotosBlancos(int votosBlancos) {
      this.votosBlancos = votosBlancos;
   }

   public double getPorcBlancos() {
      return porcBlancos;
   }

   public void setPorcBlancos(double porcBlancos) {
      this.porcBlancos = porcBlancos;
   }

   public int getVotosNulos() {
      return votosNulos;
   }

   public void setVotosNulos(int votosNulos) {
      this.votosNulos = votosNulos;
   }

   public double getPorcNulos() {
      return porcNulos;
   }

   public void setPorcNulos(double porcNulos) {
      this.porcNulos = porcNulos;
   }

}