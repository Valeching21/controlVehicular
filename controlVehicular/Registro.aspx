<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Registro.aspx.vb" Inherits="controlVehicular.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Contenedor centrado -->
    <div class="d-flex justify-content-center align-items-center" style="min-height: 80vh;">
        <div class="container" style="max-width: 450px;">
            <div class="card shadow-sm border-0" style="background-color:#979297;">
                
                <div class="card-header text-white" style="background-color:#a781b5;">
                    <h4 class="mb-0 text-center">Registro de Usuario</h4>
                </div>

                <div class="card-body">

                    <asp:Label ID="lblMensaje" runat="server" CssClass="d-block mb-3 fw-bold text-center" ForeColor="Red" />

                   
                    <div class="mb-3 text-center">
                        <label class="form-label text-purple fw-semibold">Usuario</label>
                        <div class="d-flex justify-content-center">
                            <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control border-pink text-center" style="max-width: 300px;" />
                        </div>
                    </div>

                    <div class="mb-3 text-center">
                        <label class="form-label text-purple fw-semibold">Email</label>
                        <div class="d-flex justify-content-center">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control border-pink text-center" style="max-width: 300px;" TextMode="Email" />
                        </div>
                    </div>

                    <div class="mb-3 text-center">
                        <label class="form-label text-purple fw-semibold">Contraseña</label>
                        <div class="d-flex justify-content-center">
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control border-pink text-center" style="max-width: 300px;" TextMode="Password" />
                        </div>
                    </div>

                 
                    <div class="mb-3 text-center">
                        <label class="form-label text-purple fw-semibold">Confirmar Contraseña</label>
                        <div class="d-flex justify-content-center">
                            <asp:TextBox ID="txtConfirmarPassword" runat="server" CssClass="form-control border-pink text-center" style="max-width: 300px;" TextMode="Password" />
                        </div>
                    </div>

                    <div class="text-center">
                        <asp:Button ID="btnRegistrar" runat="server" Text="Registrarse" OnClick="btnRegistrar_Click" CssClass="btn btn-pink text-white fw-bold mt-2" />
                    </div>

                </div>
            </div>
        </div>
    </div>

    <style>
        .text-purple {
            color: #fff0f5;
        }
        .border-pink {
            border: 1px solid #68397c;
        }
        .btn-pink {
            background-color: #a781b5;
            border: none;
        }
        .btn-pink:hover {
            background-color: #4b3362;
        }
    </style>

</asp:Content>
