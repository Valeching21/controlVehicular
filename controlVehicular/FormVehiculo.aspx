<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormVehiculo.aspx.vb" Inherits="controlVehicular.FormVehiculo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:HiddenField ID="editando" runat="server" />

    <!-- Panel principal -->
    <asp:Panel ID="panelFormulario" runat="server">
        <div class="container mt-4 d-flex justify-content-center">
            <div class="card shadow-sm border-0 w-100" style="max-width: 600px;">
                <div class="card-header text-white text-center">
                    <h4 class="mb-0">Formulario de Vehículo</h4>
                </div>
                <div class="card-body d-flex flex-column gap-3 align-items-center">

                    <asp:TextBox ID="txtPlaca" CssClass="form-control border-morado text-center" placeholder="Placa" runat="server" />

                    <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select border-morado text-center">
                        <asp:ListItem Text="Seleccione una marca" Value="" />
                        <asp:ListItem Text="Toyota" Value="Toyota" />
                        <asp:ListItem Text="Hyundai" Value="Hyundai" />
                        <asp:ListItem Text="Kia" Value="Kia" />
                        <asp:ListItem Text="Mazda" Value="Mazda" />
                        <asp:ListItem Text="Nissan" Value="Nissan" />
                    </asp:DropDownList>

                    <asp:DropDownList ID="ddlModelo" runat="server" CssClass="form-select border-morado text-center">
                        <asp:ListItem Text="Seleccione un modelo" Value="" />
                        <asp:ListItem Text="Sedán" Value="Sedán" />
                        <asp:ListItem Text="SUV" Value="SUV" />
                        <asp:ListItem Text="Pick-up" Value="Pick-up" />
                        <asp:ListItem Text="Hatchback" Value="Hatchback" />
                        <asp:ListItem Text="Van" Value="Van" />
                    </asp:DropDownList>

                    <asp:DropDownList ID="ddlPropietario" runat="server" CssClass="form-select border-morado text-center">
                        <asp:ListItem Text="Seleccione propietario" Value="" />
                    </asp:DropDownList>

                    <div class="d-flex gap-2">
                        <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-morado text-white fw-semibold" Text="Guardar" OnClick="btnGuardar_Click" />
                    </div>

                    <asp:Label ID="lblMensaje" runat="server" CssClass="fw-bold text-danger" />
                </div>
            </div>
        </div>
    </asp:Panel>


    <!-- GridView -->
    <asp:GridView ID="gvVehiculos" runat="server"
        AutoGenerateColumns="False"
        ShowHeaderWhenEmpty="True"
        DataKeyNames="IdVehiculo"
        CssClass="table table-striped table-hover tabla-morada"
        OnRowEditing="gvVehiculos_RowEditing"
        OnRowUpdating="gvVehiculos_RowUpdating"
        OnRowCancelingEdit="gvVehiculos_RowCancelingEdit"
        OnRowDeleting="gvVehiculos_RowDeleting">

        <Columns>
            <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn btn-morado-oscuro" />

            <asp:BoundField DataField="IdVehiculo" HeaderText="IdVehiculo" ReadOnly="True" />
            <asp:BoundField DataField="Placa" HeaderText="Placa" />
            <asp:BoundField DataField="Marca" HeaderText="Marca" />
            <asp:BoundField DataField="Modelo" HeaderText="Modelo" />
            <asp:BoundField DataField="NombrePropietario" HeaderText="Propietario" ReadOnly="True" />
            <asp:BoundField DataField="IdPropietario" HeaderText="IdPropietario" InsertVisible="False" ReadOnly="True" />
            
            <asp:CommandField ShowDeleteButton="True" DeleteText="Eliminar" ControlStyle-CssClass="btn btn-danger" />
        </Columns>
    </asp:GridView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:II-46ConnectionString %>" 
        SelectCommand="SELECT * FROM [Vehiculos]"></asp:SqlDataSource>


    <!-- SweetAlert Script -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Estilos morados personalizados -->
    <style>
        /* Morados base */
        :root {
            --morado: #6a0dad;
            --morado-oscuro: #4b0082;
            --morado-claro: #b57edc;
            --morado-fondo: #f3e8ff;
        }

        .border-morado { border: 1px solid var(--morado) !important; }

        .btn-morado { background-color: var(--morado); border: none; }
        .btn-morado:hover { background-color: var(--morado-oscuro); }

        .btn-morado-oscuro { background-color: var(--morado-oscuro); color: white; border: none; }
        .btn-morado-oscuro:hover { background-color: #3a0063; }

        /* Tarjeta */
        .card { background-color: var(--morado-fondo); }
        .card-header { background-color: var(--morado) !important; }

        /* GridView Header */
        .tabla-morada th {
            background-color: var(--morado);
            color: white !important;
        }

        .tabla-morada tr:hover td {
            background-color: #e9d6ff !important;
        }
    </style>

</asp:Content>
