<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormPersona.aspx.vb" Inherits="controlVehicular.FormPersona" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

       <asp:HiddenField ID="editando" runat="server"/>

    <div class="container mt-4">
        <h2 class="mb-4">Registro de Personas</h2>

        <div class="card p-4 mb-4 shadow-sm">
            <div class="row g-3">
                <div class="col-md-4">
                    <asp:TextBox ID="txt_nombre" placeholder="Ingresar Nombre" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txt_apellido1" placeholder="Ingresar Primer Apellido" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txt_apellido2" placeholder="Ingresar Segundo Apellido" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txt_fecha" placeholder="Ingresar Fecha de Ncimiento" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                </div>
                 <div class="col-md-4">
                    <asp:TextBox ID="txt_Nacionalidad" placeholder="Ingresar su Nacionalidad" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txt_Telefono" placeholder="Ingresar su Telefono" CssClass="form-control" runat="server" TextMode="Phone"></asp:TextBox>
                </div>
                <div class="col-md-2 d-grid">
                    <asp:Button ID="btn_guardar" CssClass="btn btn-success" runat="server" Text="Guardar" OnClick="btn_guardar_Click"  />
                </div>
                <div class="col-md-2 d-grid">
                  <asp:Button ID="btn_actualizar" CssClass="btn btn-success" runat="server" Text="Actualizar" OnClick="btn_actualizar_Click"/>
                </div>
                <div class="col-md-2 d-grid">
                   <asp:Button ID="btn_regresar" CssClass="btn btn-danger" runat="server" Text="Regresar" OnClick="btn_regresar_Click"/>
                </div>
            </div>
            <div class="mt-2">
                <asp:Label ID="lbl_mensaje" runat="server" CssClass="text-success"></asp:Label>
            </div>
         </div>
    </div>


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idPersona" DataSourceID="SqlDataSource" CssClass="table table-striped table-hover" 
        OnRowDeleting="GridView1_RowDeleting"
        OnRowEditing="GridView1_RowEditing" 
        OnRowCancelingEdit="GridView1_RowCancelingEdit" 
        OnRowUpdating="GridView1_RowUpdating" 
        OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" ShowEditButton="true" ControlStyle-CssClass="btn btn-primary" />
           <asp:BoundField DataField="idPersona" HeaderText="idPersona" ReadOnly="True" SortExpression="idPersona" Visible="False" />
           <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
           <asp:BoundField DataField="Apellido1" HeaderText="Apellido1" SortExpression="Apellido1" />
           <asp:BoundField DataField="Apellido2" HeaderText="Apellido2" SortExpression="Apellido2" />
            <asp:BoundField DataField="Nacionalidad" HeaderText="Nacionalidad" SortExpression="Nacionalidad" />
            <asp:BoundField DataField="FechaNacimiento" HeaderText="FechaNacimiento" SortExpression="FechaNacimiento" />
            <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
            <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn btn-danger" />
         </Columns>
     </asp:GridView>

    
<asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:II-46ConnectionString %>" SelectCommand="SELECT * FROM [Persona]"></asp:SqlDataSource>
</asp:Content>
