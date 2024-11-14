<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:param name="TipoMenu" select="TipoMenu"></xsl:param>


	<xsl:template match="Dulceria">
		<html lang="en">

			<head>
				<meta charset="utf-8"></meta>
				<title>
					<xsl:value-of select="@Nombre"/>

				</title>
				<meta content="width=device-width, initial-scale=1.0" name="viewport"></meta>
				<meta content="Free HTML Templates" name="keywords"></meta>
				<meta content="Free HTML Templates" name="description"></meta>

				<!-- Favicon -->
				<link href="img/favicon.ico" rel="icon"></link>

				<!-- Google Web Fonts -->
				<link rel="preconnect" href="https://fonts.googleapis.com"></link>
				<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""></link>

				<!-- Icon Font Stylesheet -->
				<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"></link>
				<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet"></link>

				<!-- Libraries Stylesheet -->
				<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet"></link>

				<!-- Customized Bootstrap Stylesheet -->
				<link href="../assets/css/bootstrap.min.css" rel="stylesheet"></link>

				<!-- Template Stylesheet -->
				<link href="../assets/css/style.css" rel="stylesheet"></link>

				<script type="text/javascript" src="assets/js/jquery-1.11.2.min.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
				<script src="assets/js/MisFunciones.js" type="text/javascript"></script>



			</head>
			<body>
				<!-- Topbar Start -->
				<div class="container-fluid px-0 d-none d-lg-block">
					<div class="row gx-0">
						<div class="col-lg-4 text-center bg-secondary py-3">
							<div class="d-inline-flex align-items-center justify-content-center">
								<i class="bi bi-envelope fs-1 text-primary me-3"></i>
								<div class="text-start">
									<h6 class="text-uppercase mb-1">Nuestro Email</h6>
									<span>
										<xsl:value-of select="@Email"/>
									</span>
								</div>
							</div>
						</div>
						<div class="col-lg-4 text-center bg-primary border-inner py-3">
							<div class="d-inline-flex align-items-center justify-content-center">
								<a href="Default.aspx?Id=0" class="navbar-brand">
									<h1 class="m-0 text-uppercase text-white">
										<xsl:for-each select="Imagenes">
											<img width="30px" height="30px" src="{Imagen}" style="object-fit: cover; padding:1px;"></img>
										</xsl:for-each>
										<font size="5px">
											<xsl:value-of select="@Nombre"/>
										</font>

									</h1>
								</a>
							</div>
						</div>
						<div class="col-lg-4 text-center bg-secondary py-3">
							<div class="d-inline-flex align-items-center justify-content-center">
								<i class="bi bi-phone-vibrate fs-1 text-primary me-3"></i>
								<div class="text-start">
									<h6 class="text-uppercase mb-1">WhatsApp</h6>
									<span>
										<xsl:value-of select="@Celular"/>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Topbar End -->


				<!-- Navbar Start -->
				<nav class="navbar navbar-expand-lg bg-dark navbar-dark shadow-sm py-3 py-lg-0 px-3 px-lg-0">
					<a href="Default.aspx?Id=0" class="navbar-brand d-block d-lg-none">
						<h1 class="m-0 text-uppercase text-white">
							<xsl:for-each select="Imagenes">
								<img width="35px" height="40px" src="{Imagen}" style="object-fit: cover; padding:2px;"></img>
							</xsl:for-each>
							<xsl:value-of select="@Nombre"/>
						</h1>
					</a>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarCollapse">
						<div class="navbar-nav ms-auto mx-lg-auto py-0">

							<xsl:for-each select="Menu/Paginas">
								<xsl:choose>
									<xsl:when test="$TipoMenu = @Id">
										<a class="nav-link scrollto active" href="{@Url}">
											<xsl:value-of select="@Nombre"></xsl:value-of>
										</a>
									</xsl:when>
									<xsl:otherwise>
										<a class="nav-link scrollto " href="{@Url}">
											<xsl:value-of select="@Nombre"></xsl:value-of>
										</a>
									</xsl:otherwise>
								</xsl:choose>

							</xsl:for-each>

						</div>
					</div>
				</nav>

				<!-- Navbar End -->
				<xsl:choose >
					<xsl:when test="$TipoMenu = 0">
						<xsl:call-template name="Inicio"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu = 1">
						<xsl:call-template name="Categorias"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu = 2">
						<xsl:call-template name="Contacto"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu = 3">
						<xsl:call-template name="Nosotros"></xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="Inicio"></xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				<!-- Footer Start -->
				<div class="container-fluid bg-img text-secondary" style="margin-top: 90px">
					<div class="container">
						<div class="row gx-5">
							<div class="col-lg-4 col-md-6 mb-lg-n5">
								<div class="d-flex flex-column align-items-center justify-content-center text-center h-100 bg-primary border-inner p-4">
									<a href="Default.apsx?Id=0" class="navbar-brand">

										<xsl:for-each select="Imagenes">
											<img width="50px" height="50px" src="{Imagen}" style="object-fit: cover; padding:1px;"></img>
										</xsl:for-each>
										<br></br>
										<h4 class="m-0 text-uppercase text-white">
											<xsl:value-of select="@Nombre"/>
										</h4>
									</a>
									<p class="mt-3">
										<xsl:value-of select="@Descripcion"/>

									</p>
								</div>
							</div>
							<div class="col-lg-8 col-md-6">
								<div class="row gx-5">
									<div class="col-lg-6 col-md-12 pt-5 mb-5">
										<h4 class="text-primary text-uppercase mb-4">Encuentranos</h4>
										<div class="d-flex mb-2">
											<i class="bi bi-geo-alt text-primary me-2"></i>
											<p class="mb-0">
												<xsl:value-of select="@Direccion"/>
											</p>
										</div>
										<div class="d-flex mb-2">
											<i class="bi bi-envelope-open text-primary me-2"></i>
											<p class="mb-0">
												<xsl:value-of select="@Email"/>
											</p>
										</div>
										<div class="d-flex mb-2">
											<i class="bi bi-telephone text-primary me-2"></i>
											<p class="mb-0">
												<xsl:value-of select="@Celular"/>
											</p>
										</div>
										<div class="d-flex mt-4">
											<a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 me-2" href="#">
												<i class="fab fa-twitter fw-normal"></i>
											</a>
											<a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 me-2" href="#">
												<i class="fab fa-facebook-f fw-normal"></i>
											</a>
											<a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 me-2" href="#">
												<i class="fab fa-linkedin-in fw-normal"></i>
											</a>
										</div>
									</div>
									<div class="col-lg-6 col-md-12 pt-0 pt-lg-5 mb-5">
										<h4 class="text-primary text-uppercase mb-4">Quick Links</h4>
										<div class="d-flex flex-column justify-content-start">
											<xsl:for-each select="Menu/Paginas">

												<a class="text-secondary mb-2" href="{@Url}">
													<i class="bi bi-arrow-right text-primary me-2"></i>
													<xsl:value-of select="@Nombre"></xsl:value-of>
												</a>
											</xsl:for-each>

										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="container-fluid text-secondary py-4" style="background: #111111;">
					<div class="container text-center">
						<p class="mb-0">
							Horario:
							<a class="text-white border-bottom" href="Default.aspx?Id=0">
								<xsl:value-of select="@Horario"/>
							</a>
							<br></br>
							<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							<a class="text-white border-bottom" href="Default.aspx?Id=0">
								<xsl:value-of select="@HorarioOff"/>
							</a>
						</p>
					</div>
				</div>
				<!-- Footer End -->
				<script type="text/javascript" src="assets/js/jquery-1.11.2.min.js"></script>

			</body>
		</html>
	</xsl:template>
	<xsl:template name="Inicio">

		<!-- About Start -->
		<div class="container-fluid pt-5">
			<div class="container">
				<div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 800px;">

					<h2 class="text-primary font-secondary">
						<xsl:value-of select="@Slogan"></xsl:value-of>
					</h2>
					<h1 class="display-4 text-uppercase">
						<xsl:value-of select="@Nombre"></xsl:value-of>
					</h1>
				</div>
				<div class="row gx-5">
					<div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 400px;">
						<div class="position-relative h-100">
							<xsl:for-each select="Imagenes/Imagen[@Id=2]">
								<img class="position-absolute w-100 h-100" src="{@Url}" style="object-fit: cover;"></img>
							</xsl:for-each>
						</div>
					</div>
					<div class="col-lg-6 pb-5">
						<p class="mb-5">
							<xsl:value-of select="Informacion_Extra/Historia/@Descubre"></xsl:value-of>
						</p>
						<div class="row g-5">
							<div class="col-sm-6">
								<div class="d-flex align-items-center justify-content-center bg-primary border-inner mb-4" style="width: 90px; height: 90px;">
									<i class="fa fa-heartbeat fa-2x text-white"></i>
								</div>
								<h4 class="text-uppercase">100% Saludable</h4>
								<p class="mb-0">
									<xsl:value-of select="Informacion_Extra/Curiosidades/@Dato2"></xsl:value-of>
								</p>
							</div>
							<div class="col-sm-6">
								<div class="d-flex align-items-center justify-content-center bg-primary border-inner mb-4" style="width: 90px; height: 90px;">
									<i class="fa fa-award fa-2x text-white"></i>
								</div>
								<h4 class="text-uppercase">Reconocimiento</h4>
								<p class="mb-0">
									<xsl:value-of select="Informacion_Extra/Curiosidades/@Dato2"></xsl:value-of>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- About End -->

	</xsl:template>
	<xsl:template name="Categorias">
		<!-- ======= Menu Section ======= -->

		<!-- Products Start -->
		<div class="container-fluid about py-5">
			<div class="container">
				<div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
					<h2 class="text-primary font-secondary">Catalogo</h2>
					<h1 class="display-4 text-uppercase">Dulces Tradicionales</h1>
				</div>
				<div class="tab-class text-center">
					<ul class="nav nav-pills d-inline-flex justify-content-center bg-dark text-uppercase border-inner p-4 mb-5">
						<li class="nav-item">
							<a class="nav-link text-white" data-bs-toggle="pill" href="#tab-1">Alcohol</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-white" data-bs-toggle="pill" href="#tab-2">Picante</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-white" data-bs-toggle="pill" href="#tab-3">Dulces</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="tab-1" class="tab-pane fade show p-0 active">
							<div class="row g-3">
								<div class="col-lg-6">
									<div class="d-flex h-100">
										<div class="flex-shrink-0">
											<img class="img-fluid" src="img/cake-1.jpg" alt="" style="width: 150px; height: 85px;"></img>
											<h4 class="bg-dark text-primary p-2 m-0">$1.00</h4>
										</div>
										<div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
											<h5 class="text-uppercase">Birthday Cake</h5>
											<span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="tab-2" class="tab-pane fade show p-0">
							<div class="row g-3">
								<div class="col-lg-6">
									<div class="d-flex h-100">
										<div class="flex-shrink-0">
											<img class="img-fluid" src="img/cake-2.jpg" alt="" style="width: 150px; height: 85px;"></img>
											<h4 class="bg-dark text-primary p-2 m-0">$92.00</h4>
										</div>
										<div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
											<h5 class="text-uppercase">Wedding Cake</h5>
											<span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="d-flex h-100">
										<div class="flex-shrink-0">
											<img class="img-fluid" src="img/cake-2.jpg" alt="" style="width: 150px; height: 85px;"></img>
											<h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
										</div>
										<div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
											<h5 class="text-uppercase">Wedding Cake</h5>
											<span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="tab-3" class="tab-pane fade show p-0">
							<div class="row g-3">
								<div class="col-lg-6">
									<div class="d-flex h-100">
										<div class="flex-shrink-0">
											<img class="img-fluid" src="img/cake-3.jpg" alt="" style="width: 150px; height: 85px;"></img>
											<h4 class="bg-dark text-primary p-2 m-0">$93.00</h4>
										</div>
										<div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
											<h5 class="text-uppercase">Custom Cake</h5>
											<span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="d-flex h-100">
										<div class="flex-shrink-0">
											<img class="img-fluid" src="img/cake-3.jpg" alt="" style="width: 150px; height: 85px;"></img>
											<h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
										</div>
										<div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
											<h5 class="text-uppercase">Custom Cake</h5>
											<span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Products End -->


	</xsl:template>
	<xsl:template name="Contacto">
		<!--API de Google-->

		<script>
			// Definir la función initMap globalmente
			function initMap() {
			// Asegúrate de que aquí inicializas el mapa correctamente
			const mapOptions = {
			center: { lat: -34.397, lng: 150.644 },  // Cambia estas coordenadas por las deseadas
			zoom: 8
			};
			const map = new google.maps.Map(document.getElementById('map'), mapOptions);
			}
		</script>

		<script>
			<![CDATA[
			(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
			key: "AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs",
			// Add other bootstrap parameters as needed, using camel case.
			// Use the 'v' parameter to indicate the version to load (alpha, beta, weekly, etc.)
			});]]>
		</script>
		<!--Referencia a mi archivo JS-->
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs&amp;callback=initMap"
				async="" defer=""></script>

		<script type="module" src="assets/js/google.js"></script>

		<section id="conctact" class="contact">

			<div data-aos="fade-up">
				<style>
					#map{
					border:0;
					width:100%;
					height:350px;
					}
				</style>
				<div id="google-map">
					<div id="map"></div>
				</div>
				<text id="direccion"> esta es una etiqueta de texto</text>
				<div class="col-lg-12 margin-bottom-30" id="street" style="height:400px; width:100%;"></div>
			</div>

			<!-- Contact Start -->
			<div class="container-fluid contact position-relative px-5" style="margin-top: 90px;">
				<div class="container">
					<div class="row g-5 mb-5">
						<div class="col-lg-4 col-md-6">
							<div class="bg-primary border-inner text-center text-white p-5">
								<i class="bi bi-geo-alt fs-1 text-white"></i>
								<h6 class="text-uppercase my-2">Ubicacion</h6>
								<span>123 Street, New York, USA</span>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="bg-primary border-inner text-center text-white p-5">
								<i class="bi bi-envelope-open fs-1 text-white"></i>
								<h6 class="text-uppercase my-2">Email</h6>
								<span>info@example.com</span>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="bg-primary border-inner text-center text-white p-5">
								<i class="bi bi-phone-vibrate fs-1 text-white"></i>
								<h6 class="text-uppercase my-2">WhatsApp</h6>
								<span>+012 345 6789</span>
							</div>
						</div>
					</div>
					<div class="row justify-content-center">
						<div class="col-lg-6">
							<form action="#" method="post" role="form" name="formu" class="php-email-form">
								<div class="row g-3">
									<div class="col-sm-6">
										<input type="text" name="nombre" class="form-control bg-light border-0 px-4" placeholder="Nombre Completo" style="height: 55px;"></input>
									</div>
									<div class="col-sm-6">
										<input type="email" name="email" class="form-control bg-light border-0 px-4" placeholder="Email" style="height: 55px;"></input>
									</div>
									<div class="col-sm-12">
										<input type="text" name="asunto" class="form-control bg-light border-0 px-4" placeholder="Asunto" style="height: 55px;"></input>
									</div>
									<div class="col-sm-12">
										<textarea class="form-control bg-light border-0 px-4 py-3" name="mensaje" rows="4" placeholder="Mensaje"></textarea>
									</div>
									<div class="col-sm-12">
										<button class="btn btn-primary border-inner w-100 py-3" id="miBoton" onClick="enviar_formulario()">Enviar</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- Contact End -->


			<script src="assets/js/MiScript.js" type="text/javascript"></script>
		</section>
	</xsl:template>
	<xsl:template name="Nosotros">
		<link href="assets/css/DragandDrop.css" rel="stylesheet"></link>
		<script src="assers/js/DragandDrop.js" type="text/javascript"></script>
		<div class="container">
			<section class="container">
				<br></br>
				<br></br>
				<h2>Musica</h2>
				<div id="Audio" style="width:100%">
					<audio controls="true" style="width:100%" autoplay="autoplay">
						<source src="assets/Musica.mp4"></source>
					</audio>
				</div>
			</section>
			<section class="tm-section-row pt-5">
				<h2>Video</h2>
				<div id="video" style="width:50%">
					<video controls="true" width="100%" autoplay="autoplay" poster="assets/img/gallery/gallery-2.jpg">
						<source src="assets/Dulces.mp4"></source>
					</video>
				</div>
				<br></br>

				<style>
					#div1 {
					width: 100%;
					height: 400px;
					padding: 10px;
					border: 1px solid #aaaaaa;
					}

				</style>

				<section class="tm-section-row pt-5">
					<h3 class="col-lg-12 mb-30"><![CDATA[Agrega Los dulces a la Canasta]]></h3>
					<xsl:for-each select="Categorias/Alcohol/Dulce/Imagen">
						<img id="drag{@Id}" src="{@Url}" draggable="true" ondragstart="drag(event)" width="336" height="69"></img>
					</xsl:for-each>
					<xsl:for-each select="Categorias/Picante/Dulce/Imagen">
						<img id="dragp{@Id}" src="{@Url}" draggable="true" ondragstart="drag(event)" width="336" height="69"></img>
					</xsl:for-each>
					<xsl:for-each select="Categorias/Dulce/Dulce/Imagen">
						<img id="dragd{@Id}" src="{@Url}" draggable="true" ondragstart="drag(event)" width="336" height="69"></img>
					</xsl:for-each>

					<br></br>
					<h2 class="col-lg-12 mb-30"><![CDATA[Canasta de Dulces]]></h2>
					<br></br>
					<div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)"></div>

					<br></br>

				</section>
				<br></br>
			</section>

		</div>
		<script>
			function allowDrop(ev) {
			ev.preventDefault();
			}

			function drag(ev) {
			ev.dataTransfer.setData("text", ev.target.id);
			}


			function drop(ev) {
			ev.preventDefault();
			var data = ev.dataTransfer.getData("text");
			ev.target.appendChild(document.getElementById(data));
			}
		</script>
	</xsl:template>
</xsl:stylesheet>
