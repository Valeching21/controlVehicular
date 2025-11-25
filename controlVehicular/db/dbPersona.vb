Imports System.Data.SqlClient

Public Class dbPersona
    Public ReadOnly connectionString As String = ConfigurationManager.ConnectionStrings("II-46connectionString").ConnectionString

    Public Function create(Persona As Persona) As String
        Try
            Dim sql As String = "INSERT INTO Persona (Nombre, Apellido1, Apellido2, FechaNacimiento, Nacionalidad, Telefono) 
                             VALUES(@Nombre, @Apellido1, @Apellido2, @FechaNacimiento, @Nacionalidad, @Telefono)"

            Dim parametros As New List(Of SqlParameter) From {
            New SqlParameter("@Nombre", Persona.Nombre),
            New SqlParameter("@Apellido1", Persona.Apellido1),
            New SqlParameter("@Apellido2", Persona.Apellido2),
            New SqlParameter("@FechaNacimiento", Persona.FechaNacimiento),
            New SqlParameter("@Nacionalidad", Persona.Nacionalidad),
            New SqlParameter("@Telefono", Persona.Telefono)
        }

            Using connection As New SqlConnection(connectionString)
                Using command As New SqlCommand(sql, connection)
                    command.Parameters.AddRange(parametros.ToArray())
                    connection.Open()
                    command.ExecuteNonQuery()
                End Using
            End Using

            Return "Persona creada correctamente."

        Catch ex As Exception
            Return "Error: " & ex.Message
        End Try
    End Function

    Public Function delete(id As Integer) As String
        Try
            Dim sql As String = "DELETE FROM Persona WHERE IdPersona = @Id"
            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@Id", id)
            }
            Using connection As New SqlConnection(connectionString)
                Using command As New SqlCommand(sql, connection)
                    command.Parameters.AddRange(parametros.ToArray())
                    connection.Open()
                    command.ExecuteNonQuery()
                End Using
            End Using
        Catch ex As Exception
        End Try
        Return "Persona Eliminada"
    End Function

    Public Function update(Persona As Persona) As String
        Try
            Dim sql As String = "UPDATE Persona 
                             SET Nombre = @Nombre, 
                                 Apellido1 = @Apellido1, 
                                 Apellido2 = @Apellido2, 
                                 FechaNacimiento = @FechaNacimiento, 
                                 Nacionalidad = @Nacionalidad,
                                 Telefono = @Telefono 
                             WHERE idPersona = @Id"

            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@Nombre", Persona.Nombre),
                New SqlParameter("@Apellido1", Persona.Apellido1),
                New SqlParameter("@Apellido2", Persona.Apellido2),
                New SqlParameter("@FechaNacimiento", Persona.FechaNacimiento),
                New SqlParameter("@Nacionalidad", Persona.Nacionalidad),
                New SqlParameter("@Telefono", Persona.Telefono),
                New SqlParameter("@Id", Persona.IdPersona)
            }

            Using connection As New SqlConnection(connectionString)
                Using command As New SqlCommand(sql, connection)
                    command.Parameters.AddRange(parametros.ToArray())
                    connection.Open()
                    command.ExecuteNonQuery()
                End Using
            End Using

            Return "Persona Actualizada"

        Catch ex As Exception
            Return "Error: " & ex.Message
        End Try
    End Function

End Class
