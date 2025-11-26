<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Login.aspx.vb" Inherits="controlVehicular.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style>
        .page-bg {
            
            min-height: 100vh;
        }
        .login-card { border-radius: 14px; overflow: hidden; border: none; }
        .brand-panel {
            background: linear-gradient(135deg,#724e90 40%,#865d94 50%);
            color: #fff;
            min-height: 260px;
            display:flex;
            align-items:center;
            justify-content:center;
            flex-direction:column;
            padding:2rem;
            text-align:center;
        }
        .brand-panel h3 { font-weight:700; margin-bottom:0.25rem; }
        .brand-panel p { opacity:.95; margin:0; font-size:.95rem; }
        .btn-pink {
            background: #724e90;
            border: none;
            color: #fff;
        }
        .form-control:focus {
            box-shadow: 0 0 0 .2rem rgba(255,95,142,.18);
            border-color: #ff6f9d;
        }
        .small-muted { color:#6b7280; }
        @media (max-width:767.98px) {
            .brand-panel { padding:1.25rem; min-height:160px; }
        }

        .btn-pink:hover {
            background-color: #4b3362;
            color:#fff;
        }
    </style>

    <div class="page-bg d-flex align-items-center justify-content-center">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-12 col-sm-10 col-md-8 col-lg-6">
                    <div class="card login-card shadow-sm">
                        <div class="row g-0">
                            <div class="col-md-5 d-none d-md-flex brand-panel">
                                <svg width="72" height="72" viewBox="0 0 24 24" fill="none"
                             xmlns="http://www.w3.org/2000/svg" aria-hidden="true" class="mb-3">
                            <rect width="24" height="24" rx="6" fill="white" fill-opacity="0.08"/>
                            <path d="M12 11a4 4 0 1 0-0.001-8.001A4 4 0 0 0 12 11z"
                                  stroke="white" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M4.5 20c0-3.59 3.36-6.5 7.5-6.5s7.5 2.91 7.5 6.5"
                                  stroke="white" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
                                <h3>Acceso de Usuario</h3>
                                <p>Ingresa tu nombre de usario y contraseña para la gestion de usuarios y vehículos</p>
                            </div>

                            <div class="col-md-7">
                                <div class="card-body p-4 p-sm-5">
                                    <h5 class="mb-3">Iniciar sesión</h5>

                                    <asp:Label ID="lblMensaje" runat="server" ForeColor="black" CssClass="d-block mb-2" Visible="false"></asp:Label>

                                    <div class="mb-3">
                                        <label for="txtUsuario" class="form-label small">Usuario</label>
                                        <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control form-control-lg" Placeholder="Usuario" />
                                    </div>

                                    <div class="mb-3">
                                        <label for="txtPassword" class="form-label small">Contraseña</label>
                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-lg" TextMode="Password" Placeholder="Contraseña" />
                                    </div>

                                    <div class="d-grid mb-3">
                                        <asp:Button ID="btnIniciarSesion" runat="server" Text="Iniciar sesión" OnClick="btnIniciarSesion_Click" CssClass="btn btn-pink btn-lg" />
                                    </div>

                                    <div class="d-flex justify-content-between align-items-center">
                                        <a href="Registro.aspx" class="small small-muted text-decoration-none">¿No tienes una cuenta?</a>
                                        <a href="#" class="small text-muted text-decoration-none">¿Olvidaste la contraseña?</a>
                                    </div>

                               
                                    <asp:Label ID="lblUsuario" runat="server" Visible="false"></asp:Label>
                                    <asp:Label ID="lblEmail" runat="server" Visible="false"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
    </div>
</asp:Content>
