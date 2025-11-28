<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormPropietario.aspx.vb" Inherits="controlVehicular.FormPropietario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container mt-4 d-flex justify-content-center">
        <div class="card shadow-sm border-0 w-100" style="max-width: 700px; background-color: #b0a7b6;">
            <div class="card-header text-white text-center" style="background-color: #5e4b6f;">
                <h4 class="mb-0">Detalle del Propietario y Vehículo</h4>
            </div>
            <div class="card-body d-flex flex-column gap-3">

                <!-- Selección de Persona -->
                <label class="fw-semibold">Propietario del Vehiculo</label>
                <asp:DropDownList ID="ddlPersonas" runat="server" AutoPostBack="True" 
                    OnSelectedIndexChanged="ddlPersonas_SelectedIndexChanged" 
                    CssClass="form-select border-pink text-center">
                    <asp:ListItem Text="Seleccione una persona" Value="" />
                </asp:DropDownList>

                <hr />


                <asp:GridView ID="gvVehiculosPersona" runat="server" AutoGenerateColumns="False" 
                    CssClass="table table-striped table-hover border border-pink" 
                    DataKeyNames="IdVehiculo" EmptyDataText="Esta persona no tiene vehículos asignados."
                    OnRowDeleting="gvVehiculosPersona_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="IdVehiculo" HeaderText="IdVehiculo" ReadOnly="True" SortExpression="IdVehiculo" />
                        <asp:BoundField DataField="Placa" HeaderText="Placa" SortExpression="Placa" />
                        <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                        <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
                        <asp:BoundField DataField="IdPropietario" HeaderText="IdPropietario" InsertVisible="False" ReadOnly="True" SortExpression="IdPropietario" />
                         <%-- Aquí solo se elimina el vehículo desde la vista de propietario --%>
                        <asp:CommandField ShowDeleteButton="True" DeleteText="Eliminar" ControlStyle-CssClass="btn btn-warning" />
                    </Columns>
                    </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:II-46ConnectionString %>" SelectCommand="SELECT * FROM [Vehiculos]"></asp:SqlDataSource>


            </div>
        </div>
    </div>

    <!-- SweetAlert Script -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Estilos rosados personalizados -->
    <style>
        .border-pink { border: 1px solid #8f8a92 !important; }
        .btn-pink { background-color: #fff; border: none; }
        .btn-pink:hover { background-color: #c2185b; }
    </style>
</asp:Content>
