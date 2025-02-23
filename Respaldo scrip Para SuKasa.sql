USE [APLIX_ECOMERCE]
GO
/****** Object:  Schema [CEMACO]    Script Date: 17/12/2024 15:55:26 ******/
CREATE SCHEMA [CEMACO]
GO
/****** Object:  Schema [NIDUX]    Script Date: 17/12/2024 15:55:26 ******/
CREATE SCHEMA [NIDUX]
GO
/****** Object:  UserDefinedFunction [CEMACO].[BUSCAR_VALORES_ATRIBUTOS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [CEMACO].[BUSCAR_VALORES_ATRIBUTOS] (@LISTA VARCHAR(MAX))
	RETURNS @TempTab TABLE
	   (id int not null)
	AS
	BEGIN
		;-- Ensure input ends with comma
		SET @LISTA = REPLACE(@LISTA + ',', ',,', ',')
		DECLARE @SP INT
	DECLARE @VALUE VARCHAR(1000)
	WHILE PATINDEX('%,%', @LISTA ) <> 0 
	BEGIN
	   SELECT  @SP = PATINDEX('%,%',@LISTA)
	   SELECT  @VALUE = LEFT(@LISTA , @SP - 1)
	   SELECT  @LISTA = STUFF(@LISTA, 1, @SP, '')
	   INSERT INTO @TempTab(id) VALUES (@VALUE)
	END
		RETURN
	END
GO
/****** Object:  UserDefinedFunction [CEMACO].[BUSCAR_VARIACIONES_ARTICULOS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [CEMACO].[BUSCAR_VARIACIONES_ARTICULOS] (@LISTA VARCHAR(MAX))
RETURNS @TempTab TABLE
   (id VARCHAR(200) not null)
AS
BEGIN
    ;-- Ensure input ends with comma
	SET @LISTA = REPLACE(@LISTA + ',', ',,', ',')
	DECLARE @SP INT
DECLARE @VALUE VARCHAR(1000)
WHILE PATINDEX('%,%', @LISTA ) <> 0 
BEGIN
   SELECT  @SP = PATINDEX('%,%',@LISTA)
   SELECT  @VALUE = LEFT(@LISTA , @SP - 1)
   SELECT  @LISTA = STUFF(@LISTA, 1, @SP, '')
   INSERT INTO @TempTab(id) VALUES (@VALUE)
END
	RETURN
END
GO
/****** Object:  UserDefinedFunction [NIDUX].[BUSCAR_VALORES_ATRIBUTOS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Funcion que busca los id
CREATE FUNCTION [NIDUX].[BUSCAR_VALORES_ATRIBUTOS] (@LISTA VARCHAR(MAX))
	RETURNS @TempTab TABLE
	   (id int not null)
	AS
	BEGIN
		;-- Ensure input ends with comma
		SET @LISTA = REPLACE(@LISTA + ',', ',,', ',')
		DECLARE @SP INT
	DECLARE @VALUE VARCHAR(1000)
	WHILE PATINDEX('%,%', @LISTA ) <> 0 
	BEGIN
	   SELECT  @SP = PATINDEX('%,%',@LISTA)
	   SELECT  @VALUE = LEFT(@LISTA , @SP - 1)
	   SELECT  @LISTA = STUFF(@LISTA, 1, @SP, '')
	   INSERT INTO @TempTab(id) VALUES (@VALUE)
	END
		RETURN
	END
GO
/****** Object:  UserDefinedFunction [NIDUX].[BUSCAR_VARIACIONES_ARTICULOS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [NIDUX].[BUSCAR_VARIACIONES_ARTICULOS] (@LISTA VARCHAR(MAX))
RETURNS @TempTab TABLE
   (id VARCHAR(200) not null)
AS
BEGIN
    ;-- Ensure input ends with comma
	SET @LISTA = REPLACE(@LISTA + ',', ',,', ',')
	DECLARE @SP INT
DECLARE @VALUE VARCHAR(1000)
WHILE PATINDEX('%,%', @LISTA ) <> 0 
BEGIN
   SELECT  @SP = PATINDEX('%,%',@LISTA)
   SELECT  @VALUE = LEFT(@LISTA , @SP - 1)
   SELECT  @LISTA = STUFF(@LISTA, 1, @SP, '')
   INSERT INTO @TempTab(id) VALUES (@VALUE)
END
	RETURN
END
GO
/****** Object:  Table [CEMACO].[ARTICULO_ESTADO]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CEMACO].[ARTICULO_ESTADO](
	[ID] [int] NOT NULL,
	[DESCRIPCION] [varchar](255) NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CEMACO].[ARTICULOS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CEMACO].[ARTICULOS](
	[ARTICULO] [varchar](255) NOT NULL,
	[NOMBRE] [varchar](max) NOT NULL,
	[NOMBRE_NIDUX] [varchar](max) NULL,
	[DESCRIPCION] [varchar](max) NULL,
	[DESCRIPCION_NIDUX] [varchar](max) NULL,
	[PESO] [decimal](28, 8) NULL,
	[ACTIVO] [varchar](2) NULL,
	[ESTADO] [int] NULL,
	[ID] [varchar](255) NULL,
	[ID_MARCA] [varchar](255) NULL,
	[ID_CATEGORIAS] [varchar](100) NULL,
	[ID_VALORES_ATRIBUTOS] [varchar](50) NULL,
	[ID_PADRE] [varchar](255) NULL,
	[ID_HIJO] [int] NULL,
	[INDICADOR_STOCK] [varchar](2) NULL,
	[DESTACADO] [varchar](2) NULL,
	[IMPUESTO] [decimal](28, 8) NOT NULL,
	[COSTO_SHIPPING] [decimal](28, 8) NULL,
	[PERMITE_RESERVA] [varchar](2) NULL,
	[PORCENTAJE_RESERVA] [decimal](28, 8) NULL,
	[LIMITE_CARRITO] [int] NULL,
	[USAR_GIF] [varchar](2) NULL,
	[GIF_TIEMPO] [int] NULL,
	[VIDEO_YOUTUBE] [varchar](max) NULL,
	[ID_TRADUC] [int] NULL,
	[NOMBRE_TRADUC] [varchar](255) NULL,
	[DESCRIPCION_TRADUC] [varchar](500) NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL,
	[TAGS] [varchar](4000) NULL,
	[SEO_TAGS] [varchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ARTICULO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [CEMACO].[ARTICULOS_CANTIDAD]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CEMACO].[ARTICULOS_CANTIDAD](
	[ARTICULO] [varchar](255) NOT NULL,
	[CANTIDAD] [decimal](28, 8) NOT NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [CEMACO].[ARTICULOS_PRECIO]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CEMACO].[ARTICULOS_PRECIO](
	[ARTICULO] [varchar](255) NOT NULL,
	[PRECIO] [decimal](28, 8) NOT NULL,
	[DESCUENTO] [decimal](28, 8) NOT NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ARTICULO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CEMACO].[ATRIBUTOS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CEMACO].[ATRIBUTOS](
	[ID] [int] NOT NULL,
	[DESCRIPCION] [varchar](255) NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CEMACO].[CATEGORIAS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CEMACO].[CATEGORIAS](
	[CODIGO_CATEGORIA] [varchar](255) NULL,
	[CODIGO_SUBCATEGORIA] [varchar](255) NULL,
	[NOMBRE] [varchar](255) NULL,
	[DESCRIPCION] [varchar](255) NULL,
	[NOMBRE_NIDUX] [varchar](255) NULL,
	[DESCRIPCION_NIDUX] [varchar](255) NULL,
	[CODIGO_NIDUX] [int] NULL,
	[ACTIVO] [varchar](2) NULL,
	[SUBCATEGORIA_NIDUX] [int] NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [CEMACO].[CREDENCIALES]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CEMACO].[CREDENCIALES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USUARIO] [varchar](255) NULL,
	[CONTRASENA] [varchar](255) NULL,
	[STOREID] [int] NULL,
	[FECHA_CONSULTA] [datetime] NOT NULL,
	[TOKEN_NIDUX] [varchar](max) NULL,
	[FECHA_HORA_TOKEN] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS](
	[id_filtro_articulo] [int] IDENTITY(1,1) NOT NULL,
	[codigo_articulo] [int] NOT NULL,
	[nombre] [int] NOT NULL,
	[nombre_nidux] [int] NOT NULL,
	[descripcion] [int] NOT NULL,
	[descripcion_nidux] [int] NOT NULL,
	[peso] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [int] NOT NULL,
	[porcentaje_descuento] [int] NOT NULL,
	[impuesto_articulo] [int] NOT NULL,
	[sincroniza] [int] NOT NULL,
	[estado] [int] NOT NULL,
	[id_nidux] [int] NOT NULL,
	[marca_nidux] [int] NOT NULL,
	[categorias] [int] NOT NULL,
	[valores_atributos] [int] NOT NULL,
	[id_padre] [int] NOT NULL,
	[id_hijo] [int] NOT NULL,
	[indicador_stock] [int] NOT NULL,
	[destacar_articulo] [int] NOT NULL,
	[costo_shipping] [int] NOT NULL,
	[permite_reserva] [int] NOT NULL,
	[porcentaje_reserva] [int] NOT NULL,
	[limite_carrito] [int] NOT NULL,
	[usa_gif] [int] NOT NULL,
	[tiempo_gif] [int] NOT NULL,
	[video_youtube] [int] NOT NULL,
	[nombre_ingles] [int] NOT NULL,
	[descripcion_ingles] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_filtro_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS](
	[id_filtro_pedido] [int] IDENTITY(1,1) NOT NULL,
	[numero_orden] [int] NOT NULL,
	[nombre_cliente] [int] NOT NULL,
	[identificacion] [int] NOT NULL,
	[correo_cliente] [int] NOT NULL,
	[tel_fijo] [int] NOT NULL,
	[tel_movil] [int] NOT NULL,
	[comprador_anonimo] [int] NOT NULL,
	[monto_impuesto] [int] NOT NULL,
	[fecha] [int] NOT NULL,
	[order_gif] [int] NOT NULL,
	[estado_orden] [int] NOT NULL,
	[moneda] [int] NOT NULL,
	[observaciones] [int] NOT NULL,
	[cod_autorizacion] [int] NOT NULL,
	[ip_origen] [int] NOT NULL,
	[estado_pago] [int] NOT NULL,
	[medio_pago] [int] NOT NULL,
	[total_orden] [int] NOT NULL,
	[uso_cupon] [int] NOT NULL,
	[tipo_cupon] [int] NOT NULL,
	[sucursal] [int] NOT NULL,
	[recoger_sucursal] [int] NOT NULL,
	[metodo_pago] [int] NOT NULL,
	[moneda_facturacion] [int] NOT NULL,
	[tipo_envio] [int] NOT NULL,
	[costo_envio] [int] NOT NULL,
	[costo_impuesto_envio] [int] NOT NULL,
	[nombre_destinatario] [int] NOT NULL,
	[identificacion_envio] [int] NOT NULL,
	[tipo_identi_envio] [int] NOT NULL,
	[correo_envio] [int] NOT NULL,
	[telefono_envio] [int] NOT NULL,
	[tel_movil_envio] [int] NOT NULL,
	[pais_envio] [int] NOT NULL,
	[provincia_envio] [int] NOT NULL,
	[canton_envio] [int] NOT NULL,
	[distrito_envio] [int] NOT NULL,
	[detalle_direccion_envio] [int] NOT NULL,
	[ciudad_envio] [int] NOT NULL,
	[codigo_zip_envio] [int] NOT NULL,
	[posicion_latitud] [int] NOT NULL,
	[posicion_longitud] [int] NOT NULL,
	[nombre_destinatario_fac] [int] NOT NULL,
	[identificacion_fac] [int] NOT NULL,
	[tipo_id_fac] [int] NOT NULL,
	[correo_fac] [int] NOT NULL,
	[telefono_fac] [int] NOT NULL,
	[tel_movil_fac] [int] NOT NULL,
	[pais_fac] [int] NOT NULL,
	[provincia_fac] [int] NOT NULL,
	[canton_fac] [int] NOT NULL,
	[distrito_fac] [int] NOT NULL,
	[detalle_dir_fac] [int] NOT NULL,
	[ciudad_fac] [int] NOT NULL,
	[codigo_zip_fac] [int] NOT NULL,
	[posicion_latitud_fac] [int] NOT NULL,
	[posicion_longitud_fac] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [CEMACO].[LISTA_REGALOS_ARTICULOS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CEMACO].[LISTA_REGALOS_ARTICULOS](
	[WISH_ID] [int] NOT NULL,
	[ID_ARTICULO] [int] NOT NULL,
	[PRODUCT_NAME] [varchar](max) NULL,
	[PRODUCT_CODE] [int] NULL,
	[PRODUCT_PRICE] [decimal](28, 8) NULL,
	[PRODUCT_SALE] [decimal](28, 8) NULL,
	[PRODUCT_TAX] [decimal](28, 8) NULL,
	[PRODUCT_TYPE] [decimal](28, 8) NULL,
	[FECHA_CAMBIO] [varchar](50) NULL,
	[WISHED_AMOUNT] [int] NULL,
	[PRODUCT_VARIATION_ID] [int] NULL,
	[GIVEN] [int] NULL,
	[BUYERS_DETAILS] [int] NULL,
	[ADDBY] [int] NULL,
	[FAVORITE] [int] NULL,
	[STOCK] [int] NULL,
	[STATUS] [int] NULL,
	[PRODUCT_URL] [varchar](max) NULL,
	[SELECTABLEAMOUNT] [int] NULL,
	[CALCULATED_TOTAL] [decimal](28, 8) NULL,
	[FINAL_PRICE] [decimal](28, 8) NULL,
	[OLD_PRICE] [decimal](28, 8) NULL,
	[RECORDDATE] [datetime] NULL,
	[SINCRONIZADO] [varchar](2) NULL,
 CONSTRAINT [PK_LISTA_REGALO] PRIMARY KEY CLUSTERED 
(
	[ID_ARTICULO] ASC,
	[WISH_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [CEMACO].[LISTA_REGALOS_DETALLES]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CEMACO].[LISTA_REGALOS_DETALLES](
	[WISH_ID] [int] NOT NULL,
	[ID_SHIPPING] [int] NULL,
	[DETAILS_SHIPPING] [varchar](max) NULL,
	[EVENTDATE] [datetime] NULL,
	[ID_STATUS] [int] NULL,
	[DETAILS_STATUS] [varchar](max) NULL,
	[OWNER_ID] [int] NULL,
	[CONSUMER_IDENTIFICATION] [varchar](100) NULL,
	[FECHA_CAMBIO] [datetime] NULL,
	[EXTRA_RECIPIENTS] [varchar](10) NULL,
	[THANKS_MSG] [varchar](max) NULL,
	[PUBLIC_MSG] [varchar](max) NULL,
	[MODE_LIST] [varchar](10) NULL,
	[USER_DIRECCION] [int] NULL,
	[LISTNAME] [varchar](max) NULL,
	[RANDOM_CODE] [varchar](100) NULL,
	[APPROVED_SHIPPING] [int] NULL,
	[EXTRA_OWNER_ID] [int] NULL,
	[ID_LIST_TYPE] [int] NULL,
	[DETAILS_LIST_TYPE] [varchar](max) NULL,
	[ID_ECOFRIENDLY] [int] NULL,
	[DETAILS_ECOFRINDLY] [varchar](max) NULL,
	[ID_ENABLE_ANONYMOUS_BUYER] [int] NULL,
	[DETAILS_ENABLE_ANONYMOUS_BUYER] [varchar](max) NULL,
	[ID_ENABLE_EXTRA_PRODUCTS_BUY] [int] NULL,
	[DETAILS_ENABLE_EXTRA_PRODUCTS_BUY] [varchar](max) NULL,
	[RECORDDATE] [datetime] NULL,
	[SINCRONIZADO] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[WISH_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [CEMACO].[MARCAS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CEMACO].[MARCAS](
	[CODIGO_MARCA] [varchar](255) NULL,
	[DESCRIPCION] [varchar](255) NULL,
	[DESCRIPCION_NIDUX] [varchar](255) NULL,
	[CODIGO_NIDUX] [int] NULL,
	[ACTIVO] [varchar](2) NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [CEMACO].[PEDIDOS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CEMACO].[PEDIDOS](
	[ORDERID] [varchar](100) NOT NULL,
	[CLIENTE] [varchar](255) NOT NULL,
	[IDENTIFICACION] [varchar](100) NOT NULL,
	[CORREO] [varchar](255) NOT NULL,
	[TELEFONO_FIJO] [varchar](20) NULL,
	[TELEFONO_MOVIL] [varchar](20) NULL,
	[ES_ANONIMO] [int] NULL,
	[MONTO_IMPUESTOS] [varchar](50) NULL,
	[FECHA_ORDEN] [datetime] NOT NULL,
	[ORDERGIFTPOINTSUSED] [varchar](30) NULL,
	[ESTADO_ORDEN] [varchar](30) NOT NULL,
	[TIPO_ENVIO] [varchar](30) NULL,
	[COSTO_TOTAL_SHIPPING] [varchar](100) NULL,
	[TASA_IMPUESTO_SHIPPING] [varchar](15) NULL,
	[MONEDA] [varchar](30) NOT NULL,
	[OBSERVACIONES] [varchar](500) NULL,
	[CODIGO_AUTORIZACION] [varchar](30) NULL,
	[IP_ORIGEN] [varchar](20) NULL,
	[ESTADO_PAGO] [varchar](50) NOT NULL,
	[MEDIO_PAGO] [varchar](50) NOT NULL,
	[TOTAL] [varchar](50) NOT NULL,
	[CUPONUSADO] [varchar](50) NULL,
	[CUPONTIPO] [varchar](50) NULL,
	[SUCURSAL] [varchar](100) NULL,
	[RECOGER_SUCURSAL] [varchar](50) NULL,
	[MONEDA_FE] [varchar](200) NULL,
	[CODIGO_METODO_PAGO] [varchar](200) NULL,
	[CONSECUTIVO] [varchar](255) NULL,
	[NOMBRE_DESTINATARIO_ENVIO] [varchar](255) NULL,
	[IDENTIFICACION_ENVIO] [varchar](20) NULL,
	[TIPO_IDENTIFICACION_ENVIO] [varchar](50) NULL,
	[CORREO_ENVIO] [varchar](255) NULL,
	[TELEFONO_ENVIO] [varchar](20) NULL,
	[MOVIL_ENVIO] [varchar](20) NULL,
	[PAIS_ENVIO] [varchar](50) NULL,
	[PROVINCIA_ENVIO] [varchar](50) NULL,
	[CANTON_ENVIO] [varchar](50) NULL,
	[DISTRITO_ENVIO] [varchar](50) NULL,
	[DETALLE_DIRECCION_ENVIO] [varchar](500) NULL,
	[CIUDAD_ENVIO] [varchar](255) NULL,
	[ZIP_ENVIO] [varchar](10) NULL,
	[GEO_LATITUD_ENVIO] [varchar](255) NULL,
	[GEO_LONGITUD_ENVIO] [varchar](255) NULL,
	[NOMBRE_DESTINATARIO_FAC] [varchar](255) NULL,
	[IDENTIFICACION_FAC] [varchar](20) NULL,
	[TIPO_IDENTIFICACION_FAC] [varchar](50) NULL,
	[CORREO_FAC] [varchar](255) NULL,
	[TELEFONO_FAC] [varchar](20) NULL,
	[MOVIL_FAC] [varchar](20) NULL,
	[PAIS_FAC] [varchar](50) NULL,
	[PROVINCIA_FAC] [varchar](50) NULL,
	[CANTON_FAC] [varchar](50) NULL,
	[DISTRITO_FAC] [varchar](50) NULL,
	[DETALLE_DIRECCION_FAC] [varchar](500) NULL,
	[CIUDAD_FAC] [varchar](255) NULL,
	[ZIP_FAC] [varchar](10) NULL,
	[GEO_LATITUD_FAC] [varchar](255) NULL,
	[GEO_LONGITUD_FAC] [varchar](255) NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL,
	[WISH_ID] [int] NULL,
	[WISK_ID_SINCRONIZADO] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ORDERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CEMACO].[PEDIDOS_LINEA]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CEMACO].[PEDIDOS_LINEA](
	[ORDERID] [varchar](100) NOT NULL,
	[ID_PRODUCTO] [int] NULL,
	[ID_VARIACION] [int] NULL,
	[SKU] [varchar](255) NOT NULL,
	[NOMBRE_PRODUCTO] [varchar](255) NOT NULL,
	[PRECIO] [varchar](255) NOT NULL,
	[CANTIDAD] [int] NOT NULL,
	[PORCENTAJE_DESCUENTO] [varchar](50) NOT NULL,
	[SUBTOTAL_DESCUENTO] [varchar](50) NOT NULL,
	[SUBTOTAL_LINEA] [varchar](50) NOT NULL,
	[IMPUESTO] [varchar](50) NOT NULL,
	[SUBTOTAL_IMPUESTOS] [varchar](50) NOT NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [CEMACO].[VALORES_ATRIBUTOS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CEMACO].[VALORES_ATRIBUTOS](
	[ID] [int] NOT NULL,
	[DESCRIPCION] [varchar](255) NULL,
	[ID_ATRIBUTO] [int] NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NIDUX_OBTENER_PRODUCTO_HOGAR]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NIDUX_OBTENER_PRODUCTO_HOGAR](
	[NO_ARTI] [varchar](15) NOT NULL,
	[DESCRIPCION] [varchar](120) NULL,
	[CATEGORIA] [varchar](8) NULL,
	[PRECIO] [varchar](13) NULL,
	[PORC_DESC] [varchar](7) NULL,
	[PRECIO_CON_DESC] [varchar](13) NULL,
	[EXISTENCIA] [decimal](18, 0) NULL,
	[CLASE] [varchar](8) NULL,
	[PESO] [decimal](18, 0) NULL,
	[SUBCLASIFICACION_WEB] [varchar](15) NULL,
	[DESC_SUBCLASIFICACION_WEB] [varchar](30) NULL,
	[CLASIFICACION_WEB] [varchar](4000) NULL,
	[DESC_CLASIFICACION_WEB] [varchar](30) NULL,
	[VIGENCIA_DESDE_FH] [varchar](10) NULL,
	[VIGENCIA_HASTA_FH] [varchar](10) NULL,
	[CARACTERISTICAS] [varchar](4000) NULL,
	[NIDUX_COD_CATEGORIA] [varchar](81) NULL,
	[NIDUX_COD_MARCA] [decimal](18, 0) NULL,
	[DESTACADO] [varchar](1) NULL,
	[TAGS] [varchar](500) NULL,
	[SEO_TAG] [varchar](500) NULL,
	[URL_VIDEO] [varchar](500) NULL,
	[RECORDDATE] [datetime] NULL,
	[ESTADO] [decimal](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [NIDUX].[ARTICULO_ESTADO]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NIDUX].[ARTICULO_ESTADO](
	[ID] [int] NOT NULL,
	[DESCRIPCION] [varchar](255) NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [NIDUX].[ARTICULOS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NIDUX].[ARTICULOS](
	[ARTICULO] [varchar](255) NOT NULL,
	[NOMBRE] [varchar](max) NOT NULL,
	[NOMBRE_NIDUX] [varchar](max) NULL,
	[DESCRIPCION] [varchar](max) NULL,
	[DESCRIPCION_NIDUX] [varchar](max) NULL,
	[PESO] [decimal](28, 8) NULL,
	[ACTIVO] [varchar](2) NULL,
	[ESTADO] [int] NULL,
	[ID] [varchar](255) NULL,
	[ID_MARCA] [varchar](255) NULL,
	[ID_CATEGORIAS] [varchar](100) NULL,
	[ID_VALORES_ATRIBUTOS] [varchar](50) NULL,
	[ID_PADRE] [varchar](255) NULL,
	[ID_HIJO] [int] NULL,
	[INDICADOR_STOCK] [varchar](2) NULL,
	[DESTACADO] [varchar](2) NULL,
	[IMPUESTO] [decimal](28, 8) NOT NULL,
	[COSTO_SHIPPING] [decimal](28, 8) NULL,
	[PERMITE_RESERVA] [varchar](2) NULL,
	[PORCENTAJE_RESERVA] [decimal](28, 8) NULL,
	[LIMITE_CARRITO] [int] NULL,
	[USAR_GIF] [varchar](2) NULL,
	[GIF_TIEMPO] [int] NULL,
	[VIDEO_YOUTUBE] [varchar](max) NULL,
	[ID_TRADUC] [int] NULL,
	[NOMBRE_TRADUC] [varchar](255) NULL,
	[DESCRIPCION_TRADUC] [varchar](500) NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL,
	[TAGS] [varchar](4000) NULL,
	[SEO_TAGS] [varchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ARTICULO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [NIDUX].[ARTICULOS_CANTIDAD]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NIDUX].[ARTICULOS_CANTIDAD](
	[ARTICULO] [varchar](255) NOT NULL,
	[CANTIDAD] [decimal](28, 8) NOT NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [NIDUX].[ARTICULOS_PRECIO]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NIDUX].[ARTICULOS_PRECIO](
	[ARTICULO] [varchar](255) NOT NULL,
	[PRECIO] [decimal](28, 8) NOT NULL,
	[DESCUENTO] [decimal](28, 8) NOT NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ARTICULO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [NIDUX].[ATRIBUTOS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NIDUX].[ATRIBUTOS](
	[ID] [int] NOT NULL,
	[DESCRIPCION] [varchar](255) NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [NIDUX].[CATEGORIAS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NIDUX].[CATEGORIAS](
	[CODIGO_CATEGORIA] [varchar](255) NULL,
	[CODIGO_SUBCATEGORIA] [varchar](255) NULL,
	[NOMBRE] [varchar](255) NULL,
	[DESCRIPCION] [varchar](255) NULL,
	[NOMBRE_NIDUX] [varchar](255) NULL,
	[DESCRIPCION_NIDUX] [varchar](255) NULL,
	[CODIGO_NIDUX] [int] NULL,
	[ACTIVO] [varchar](2) NULL,
	[SUBCATEGORIA_NIDUX] [int] NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [NIDUX].[CREDENCIALES]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NIDUX].[CREDENCIALES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USUARIO] [varchar](255) NULL,
	[CONTRASENA] [varchar](255) NULL,
	[STOREID] [int] NULL,
	[FECHA_CONSULTA] [datetime] NOT NULL,
	[TOKEN_NIDUX] [varchar](max) NULL,
	[FECHA_HORA_TOKEN] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS](
	[id_filtro_articulo] [int] IDENTITY(1,1) NOT NULL,
	[codigo_articulo] [int] NOT NULL,
	[nombre] [int] NOT NULL,
	[nombre_nidux] [int] NOT NULL,
	[descripcion] [int] NOT NULL,
	[descripcion_nidux] [int] NOT NULL,
	[peso] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [int] NOT NULL,
	[porcentaje_descuento] [int] NOT NULL,
	[impuesto_articulo] [int] NOT NULL,
	[sincroniza] [int] NOT NULL,
	[estado] [int] NOT NULL,
	[id_nidux] [int] NOT NULL,
	[marca_nidux] [int] NOT NULL,
	[categorias] [int] NOT NULL,
	[valores_atributos] [int] NOT NULL,
	[id_padre] [int] NOT NULL,
	[id_hijo] [int] NOT NULL,
	[indicador_stock] [int] NOT NULL,
	[destacar_articulo] [int] NOT NULL,
	[costo_shipping] [int] NOT NULL,
	[permite_reserva] [int] NOT NULL,
	[porcentaje_reserva] [int] NOT NULL,
	[limite_carrito] [int] NOT NULL,
	[usa_gif] [int] NOT NULL,
	[tiempo_gif] [int] NOT NULL,
	[video_youtube] [int] NOT NULL,
	[nombre_ingles] [int] NOT NULL,
	[descripcion_ingles] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_filtro_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS](
	[id_filtro_pedido] [int] IDENTITY(1,1) NOT NULL,
	[numero_orden] [int] NOT NULL,
	[nombre_cliente] [int] NOT NULL,
	[identificacion] [int] NOT NULL,
	[correo_cliente] [int] NOT NULL,
	[tel_fijo] [int] NOT NULL,
	[tel_movil] [int] NOT NULL,
	[comprador_anonimo] [int] NOT NULL,
	[monto_impuesto] [int] NOT NULL,
	[fecha] [int] NOT NULL,
	[order_gif] [int] NOT NULL,
	[estado_orden] [int] NOT NULL,
	[moneda] [int] NOT NULL,
	[observaciones] [int] NOT NULL,
	[cod_autorizacion] [int] NOT NULL,
	[ip_origen] [int] NOT NULL,
	[estado_pago] [int] NOT NULL,
	[medio_pago] [int] NOT NULL,
	[total_orden] [int] NOT NULL,
	[uso_cupon] [int] NOT NULL,
	[tipo_cupon] [int] NOT NULL,
	[sucursal] [int] NOT NULL,
	[recoger_sucursal] [int] NOT NULL,
	[metodo_pago] [int] NOT NULL,
	[moneda_facturacion] [int] NOT NULL,
	[tipo_envio] [int] NOT NULL,
	[costo_envio] [int] NOT NULL,
	[costo_impuesto_envio] [int] NOT NULL,
	[nombre_destinatario] [int] NOT NULL,
	[identificacion_envio] [int] NOT NULL,
	[tipo_identi_envio] [int] NOT NULL,
	[correo_envio] [int] NOT NULL,
	[telefono_envio] [int] NOT NULL,
	[tel_movil_envio] [int] NOT NULL,
	[pais_envio] [int] NOT NULL,
	[provincia_envio] [int] NOT NULL,
	[canton_envio] [int] NOT NULL,
	[distrito_envio] [int] NOT NULL,
	[detalle_direccion_envio] [int] NOT NULL,
	[ciudad_envio] [int] NOT NULL,
	[codigo_zip_envio] [int] NOT NULL,
	[posicion_latitud] [int] NOT NULL,
	[posicion_longitud] [int] NOT NULL,
	[nombre_destinatario_fac] [int] NOT NULL,
	[identificacion_fac] [int] NOT NULL,
	[tipo_id_fac] [int] NOT NULL,
	[correo_fac] [int] NOT NULL,
	[telefono_fac] [int] NOT NULL,
	[tel_movil_fac] [int] NOT NULL,
	[pais_fac] [int] NOT NULL,
	[provincia_fac] [int] NOT NULL,
	[canton_fac] [int] NOT NULL,
	[distrito_fac] [int] NOT NULL,
	[detalle_dir_fac] [int] NOT NULL,
	[ciudad_fac] [int] NOT NULL,
	[codigo_zip_fac] [int] NOT NULL,
	[posicion_latitud_fac] [int] NOT NULL,
	[posicion_longitud_fac] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [NIDUX].[MARCAS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NIDUX].[MARCAS](
	[CODIGO_MARCA] [varchar](255) NULL,
	[DESCRIPCION] [varchar](255) NULL,
	[DESCRIPCION_NIDUX] [varchar](255) NULL,
	[CODIGO_NIDUX] [int] NULL,
	[ACTIVO] [varchar](2) NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [NIDUX].[PEDIDOS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NIDUX].[PEDIDOS](
	[ORDERID] [varchar](100) NOT NULL,
	[WISH_ID] [int] NULL,
	[CLIENTE] [varchar](255) NOT NULL,
	[IDENTIFICACION] [varchar](100) NOT NULL,
	[CORREO] [varchar](255) NOT NULL,
	[TELEFONO_FIJO] [varchar](20) NULL,
	[TELEFONO_MOVIL] [varchar](20) NULL,
	[ES_ANONIMO] [int] NULL,
	[MONTO_IMPUESTOS] [varchar](50) NULL,
	[FECHA_ORDEN] [datetime] NOT NULL,
	[ORDERGIFTPOINTSUSED] [varchar](30) NULL,
	[ESTADO_ORDEN] [varchar](30) NOT NULL,
	[TIPO_ENVIO] [varchar](30) NULL,
	[COSTO_TOTAL_SHIPPING] [varchar](100) NULL,
	[TASA_IMPUESTO_SHIPPING] [varchar](15) NULL,
	[MONEDA] [varchar](30) NOT NULL,
	[OBSERVACIONES] [varchar](500) NULL,
	[CODIGO_AUTORIZACION] [varchar](30) NULL,
	[IP_ORIGEN] [varchar](20) NULL,
	[ESTADO_PAGO] [varchar](50) NOT NULL,
	[MEDIO_PAGO] [varchar](50) NOT NULL,
	[TOTAL] [varchar](50) NOT NULL,
	[CUPONUSADO] [varchar](50) NULL,
	[CUPONTIPO] [varchar](50) NULL,
	[SUCURSAL] [varchar](100) NULL,
	[RECOGER_SUCURSAL] [varchar](50) NULL,
	[MONEDA_FE] [varchar](200) NULL,
	[CODIGO_METODO_PAGO] [varchar](200) NULL,
	[CONSECUTIVO] [varchar](255) NULL,
	[NOMBRE_DESTINATARIO_ENVIO] [varchar](255) NULL,
	[IDENTIFICACION_ENVIO] [varchar](20) NULL,
	[TIPO_IDENTIFICACION_ENVIO] [varchar](50) NULL,
	[CORREO_ENVIO] [varchar](255) NULL,
	[TELEFONO_ENVIO] [varchar](20) NULL,
	[MOVIL_ENVIO] [varchar](20) NULL,
	[PAIS_ENVIO] [varchar](50) NULL,
	[PROVINCIA_ENVIO] [varchar](50) NULL,
	[CANTON_ENVIO] [varchar](50) NULL,
	[DISTRITO_ENVIO] [varchar](50) NULL,
	[DETALLE_DIRECCION_ENVIO] [varchar](500) NULL,
	[CIUDAD_ENVIO] [varchar](255) NULL,
	[ZIP_ENVIO] [varchar](10) NULL,
	[GEO_LATITUD_ENVIO] [varchar](255) NULL,
	[GEO_LONGITUD_ENVIO] [varchar](255) NULL,
	[NOMBRE_DESTINATARIO_FAC] [varchar](255) NULL,
	[IDENTIFICACION_FAC] [varchar](20) NULL,
	[TIPO_IDENTIFICACION_FAC] [varchar](50) NULL,
	[CORREO_FAC] [varchar](255) NULL,
	[TELEFONO_FAC] [varchar](20) NULL,
	[MOVIL_FAC] [varchar](20) NULL,
	[PAIS_FAC] [varchar](50) NULL,
	[PROVINCIA_FAC] [varchar](50) NULL,
	[CANTON_FAC] [varchar](50) NULL,
	[DISTRITO_FAC] [varchar](50) NULL,
	[DETALLE_DIRECCION_FAC] [varchar](500) NULL,
	[CIUDAD_FAC] [varchar](255) NULL,
	[ZIP_FAC] [varchar](10) NULL,
	[GEO_LATITUD_FAC] [varchar](255) NULL,
	[GEO_LONGITUD_FAC] [varchar](255) NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL,
	[WISK_ID_SINCRONIZADO] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ORDERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [NIDUX].[PEDIDOS_LINEA]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NIDUX].[PEDIDOS_LINEA](
	[ORDERID] [varchar](100) NOT NULL,
	[ID_PRODUCTO] [int] NULL,
	[ID_VARIACION] [int] NULL,
	[SKU] [varchar](255) NOT NULL,
	[NOMBRE_PRODUCTO] [varchar](255) NOT NULL,
	[PRECIO] [varchar](255) NOT NULL,
	[CANTIDAD] [int] NOT NULL,
	[PORCENTAJE_DESCUENTO] [varchar](50) NOT NULL,
	[SUBTOTAL_DESCUENTO] [varchar](50) NOT NULL,
	[SUBTOTAL_LINEA] [varchar](50) NOT NULL,
	[IMPUESTO] [varchar](50) NOT NULL,
	[SUBTOTAL_IMPUESTOS] [varchar](50) NOT NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [NIDUX].[RESPALDO_ARTICULOS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NIDUX].[RESPALDO_ARTICULOS](
	[ARTICULO] [varchar](255) NOT NULL,
	[NOMBRE] [varchar](max) NOT NULL,
	[NOMBRE_NIDUX] [varchar](max) NULL,
	[DESCRIPCION] [varchar](max) NULL,
	[DESCRIPCION_NIDUX] [varchar](max) NULL,
	[PESO] [decimal](28, 8) NULL,
	[ACTIVO] [varchar](2) NULL,
	[ESTADO] [int] NULL,
	[ID] [varchar](255) NULL,
	[ID_MARCA] [varchar](255) NULL,
	[ID_CATEGORIAS] [varchar](100) NULL,
	[ID_VALORES_ATRIBUTOS] [varchar](50) NULL,
	[ID_PADRE] [varchar](255) NULL,
	[ID_HIJO] [int] NULL,
	[INDICADOR_STOCK] [varchar](2) NULL,
	[DESTACADO] [varchar](2) NULL,
	[IMPUESTO] [decimal](28, 8) NOT NULL,
	[COSTO_SHIPPING] [decimal](28, 8) NULL,
	[PERMITE_RESERVA] [varchar](2) NULL,
	[PORCENTAJE_RESERVA] [decimal](28, 8) NULL,
	[LIMITE_CARRITO] [int] NULL,
	[USAR_GIF] [varchar](2) NULL,
	[GIF_TIEMPO] [int] NULL,
	[VIDEO_YOUTUBE] [varchar](max) NULL,
	[ID_TRADUC] [int] NULL,
	[NOMBRE_TRADUC] [varchar](255) NULL,
	[DESCRIPCION_TRADUC] [varchar](500) NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL,
	[TAGS] [varchar](4000) NULL,
	[SEO_TAGS] [varchar](4000) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [NIDUX].[VALORES_ATRIBUTOS]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NIDUX].[VALORES_ATRIBUTOS](
	[ID] [int] NOT NULL,
	[DESCRIPCION] [varchar](255) NULL,
	[ID_ATRIBUTO] [int] NULL,
	[CREATEDATE] [datetime] NOT NULL,
	[RECORDDATE] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [NIDUX].[VISTA_CODISA]    Script Date: 17/12/2024 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NIDUX].[VISTA_CODISA](
	[ARTICULO] [varchar](254) NULL,
	[PRECIO] [decimal](28, 8) NULL,
	[DESCUENTO] [decimal](28, 8) NULL,
	[EXISTENCIA] [decimal](28, 8) NULL
) ON [PRIMARY]
GO
ALTER TABLE [CEMACO].[ARTICULO_ESTADO] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [CEMACO].[ARTICULO_ESTADO] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [CEMACO].[ARTICULOS] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [CEMACO].[ARTICULOS] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [CEMACO].[ARTICULOS_CANTIDAD] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [CEMACO].[ARTICULOS_CANTIDAD] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [CEMACO].[ARTICULOS_PRECIO] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [CEMACO].[ARTICULOS_PRECIO] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [CEMACO].[ATRIBUTOS] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [CEMACO].[ATRIBUTOS] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [CEMACO].[CATEGORIAS] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [CEMACO].[CATEGORIAS] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [CEMACO].[CREDENCIALES] ADD  DEFAULT (getdate()) FOR [FECHA_CONSULTA]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [codigo_articulo]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [nombre]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [nombre_nidux]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [descripcion]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [descripcion_nidux]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [peso]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [cantidad]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [precio]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [porcentaje_descuento]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [impuesto_articulo]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [sincroniza]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [id_nidux]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [marca_nidux]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [categorias]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [valores_atributos]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [id_padre]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [id_hijo]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [indicador_stock]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [destacar_articulo]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [costo_shipping]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [permite_reserva]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [porcentaje_reserva]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [limite_carrito]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [usa_gif]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [tiempo_gif]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [video_youtube]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [nombre_ingles]
GO
ALTER TABLE [CEMACO].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [descripcion_ingles]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [numero_orden]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [nombre_cliente]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [identificacion]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [correo_cliente]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [tel_fijo]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [tel_movil]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [comprador_anonimo]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [monto_impuesto]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [fecha]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [order_gif]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [estado_orden]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [moneda]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [observaciones]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [cod_autorizacion]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [ip_origen]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [estado_pago]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [medio_pago]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [total_orden]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [uso_cupon]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [tipo_cupon]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [sucursal]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [recoger_sucursal]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [metodo_pago]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [moneda_facturacion]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [tipo_envio]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [costo_envio]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [costo_impuesto_envio]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [nombre_destinatario]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [identificacion_envio]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [tipo_identi_envio]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [correo_envio]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [telefono_envio]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [tel_movil_envio]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [pais_envio]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [provincia_envio]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [canton_envio]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [distrito_envio]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [detalle_direccion_envio]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [ciudad_envio]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [codigo_zip_envio]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [posicion_latitud]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [posicion_longitud]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [nombre_destinatario_fac]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [identificacion_fac]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [tipo_id_fac]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [correo_fac]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [telefono_fac]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [tel_movil_fac]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [pais_fac]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [provincia_fac]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [canton_fac]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [distrito_fac]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [detalle_dir_fac]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [ciudad_fac]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [codigo_zip_fac]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [posicion_latitud_fac]
GO
ALTER TABLE [CEMACO].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [posicion_longitud_fac]
GO
ALTER TABLE [CEMACO].[MARCAS] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [CEMACO].[MARCAS] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [CEMACO].[PEDIDOS] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [CEMACO].[PEDIDOS] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [CEMACO].[PEDIDOS_LINEA] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [CEMACO].[PEDIDOS_LINEA] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [CEMACO].[VALORES_ATRIBUTOS] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [CEMACO].[VALORES_ATRIBUTOS] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [dbo].[NIDUX_OBTENER_PRODUCTO_HOGAR] ADD  DEFAULT ((0)) FOR [NIDUX_COD_CATEGORIA]
GO
ALTER TABLE [NIDUX].[ARTICULO_ESTADO] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [NIDUX].[ARTICULO_ESTADO] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [NIDUX].[ARTICULOS] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [NIDUX].[ARTICULOS] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [NIDUX].[ARTICULOS_CANTIDAD] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [NIDUX].[ARTICULOS_CANTIDAD] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [NIDUX].[ARTICULOS_PRECIO] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [NIDUX].[ARTICULOS_PRECIO] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [NIDUX].[ATRIBUTOS] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [NIDUX].[ATRIBUTOS] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [NIDUX].[CATEGORIAS] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [NIDUX].[CATEGORIAS] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [NIDUX].[CREDENCIALES] ADD  DEFAULT (getdate()) FOR [FECHA_CONSULTA]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [codigo_articulo]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [nombre]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [nombre_nidux]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [descripcion]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [descripcion_nidux]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [peso]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [cantidad]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [precio]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [porcentaje_descuento]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [impuesto_articulo]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [sincroniza]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [id_nidux]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [marca_nidux]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [categorias]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [valores_atributos]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [id_padre]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [id_hijo]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [indicador_stock]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [destacar_articulo]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [costo_shipping]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [permite_reserva]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [porcentaje_reserva]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [limite_carrito]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [usa_gif]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [tiempo_gif]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [video_youtube]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [nombre_ingles]
GO
ALTER TABLE [NIDUX].[FILTRO_ARTICULO_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [descripcion_ingles]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [numero_orden]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [nombre_cliente]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [identificacion]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [correo_cliente]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [tel_fijo]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [tel_movil]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [comprador_anonimo]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [monto_impuesto]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [fecha]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [order_gif]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [estado_orden]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [moneda]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [observaciones]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [cod_autorizacion]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [ip_origen]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [estado_pago]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [medio_pago]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [total_orden]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [uso_cupon]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [tipo_cupon]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [sucursal]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [recoger_sucursal]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [metodo_pago]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [moneda_facturacion]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [tipo_envio]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [costo_envio]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [costo_impuesto_envio]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [nombre_destinatario]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [identificacion_envio]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [tipo_identi_envio]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [correo_envio]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [telefono_envio]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [tel_movil_envio]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [pais_envio]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [provincia_envio]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [canton_envio]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [distrito_envio]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [detalle_direccion_envio]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [ciudad_envio]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [codigo_zip_envio]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [posicion_latitud]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [posicion_longitud]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [nombre_destinatario_fac]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [identificacion_fac]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [tipo_id_fac]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [correo_fac]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [telefono_fac]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [tel_movil_fac]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [pais_fac]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [provincia_fac]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [canton_fac]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [distrito_fac]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [detalle_dir_fac]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [ciudad_fac]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [codigo_zip_fac]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [posicion_latitud_fac]
GO
ALTER TABLE [NIDUX].[FILTRO_PEDIDOS_TABLAS_PROPIAS] ADD  DEFAULT ((1)) FOR [posicion_longitud_fac]
GO
ALTER TABLE [NIDUX].[MARCAS] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [NIDUX].[MARCAS] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [NIDUX].[PEDIDOS] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [NIDUX].[PEDIDOS] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [NIDUX].[PEDIDOS_LINEA] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [NIDUX].[PEDIDOS_LINEA] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [NIDUX].[VALORES_ATRIBUTOS] ADD  DEFAULT (getdate()) FOR [CREATEDATE]
GO
ALTER TABLE [NIDUX].[VALORES_ATRIBUTOS] ADD  DEFAULT (getdate()) FOR [RECORDDATE]
GO
ALTER TABLE [CEMACO].[ARTICULOS_CANTIDAD]  WITH CHECK ADD  CONSTRAINT [fk_Articulo_Cantidad] FOREIGN KEY([ARTICULO])
REFERENCES [CEMACO].[ARTICULOS] ([ARTICULO])
GO
ALTER TABLE [CEMACO].[ARTICULOS_CANTIDAD] CHECK CONSTRAINT [fk_Articulo_Cantidad]
GO
ALTER TABLE [CEMACO].[ARTICULOS_PRECIO]  WITH CHECK ADD  CONSTRAINT [fk_Articulo_Precio] FOREIGN KEY([ARTICULO])
REFERENCES [CEMACO].[ARTICULOS] ([ARTICULO])
GO
ALTER TABLE [CEMACO].[ARTICULOS_PRECIO] CHECK CONSTRAINT [fk_Articulo_Precio]
GO
ALTER TABLE [CEMACO].[PEDIDOS_LINEA]  WITH CHECK ADD  CONSTRAINT [fk_Pedidos_Linea] FOREIGN KEY([ORDERID])
REFERENCES [CEMACO].[PEDIDOS] ([ORDERID])
GO
ALTER TABLE [CEMACO].[PEDIDOS_LINEA] CHECK CONSTRAINT [fk_Pedidos_Linea]
GO
ALTER TABLE [CEMACO].[VALORES_ATRIBUTOS]  WITH CHECK ADD  CONSTRAINT [fk_Atributos] FOREIGN KEY([ID_ATRIBUTO])
REFERENCES [CEMACO].[ATRIBUTOS] ([ID])
GO
ALTER TABLE [CEMACO].[VALORES_ATRIBUTOS] CHECK CONSTRAINT [fk_Atributos]
GO
ALTER TABLE [NIDUX].[ARTICULOS_CANTIDAD]  WITH CHECK ADD  CONSTRAINT [fk_Articulo_Cantidad] FOREIGN KEY([ARTICULO])
REFERENCES [NIDUX].[ARTICULOS] ([ARTICULO])
GO
ALTER TABLE [NIDUX].[ARTICULOS_CANTIDAD] CHECK CONSTRAINT [fk_Articulo_Cantidad]
GO
ALTER TABLE [NIDUX].[ARTICULOS_PRECIO]  WITH CHECK ADD  CONSTRAINT [fk_Articulo_Precio] FOREIGN KEY([ARTICULO])
REFERENCES [NIDUX].[ARTICULOS] ([ARTICULO])
GO
ALTER TABLE [NIDUX].[ARTICULOS_PRECIO] CHECK CONSTRAINT [fk_Articulo_Precio]
GO
ALTER TABLE [NIDUX].[PEDIDOS_LINEA]  WITH CHECK ADD  CONSTRAINT [fk_Pedidos_Linea] FOREIGN KEY([ORDERID])
REFERENCES [NIDUX].[PEDIDOS] ([ORDERID])
GO
ALTER TABLE [NIDUX].[PEDIDOS_LINEA] CHECK CONSTRAINT [fk_Pedidos_Linea]
GO
ALTER TABLE [NIDUX].[VALORES_ATRIBUTOS]  WITH CHECK ADD  CONSTRAINT [fk_Atributos] FOREIGN KEY([ID_ATRIBUTO])
REFERENCES [NIDUX].[ATRIBUTOS] ([ID])
GO
ALTER TABLE [NIDUX].[VALORES_ATRIBUTOS] CHECK CONSTRAINT [fk_Atributos]
GO
/****** Object:  StoredProcedure [CEMACO].[ACT_ACTIVAR_ARTICULOS_APP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ACT_ACTIVAR_ARTICULOS_APP](@ARTICULO VARCHAR(255), @ACTIVO VARCHAR(2))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS
				SET
					ACTIVO = @ACTIVO
				WHERE ARTICULO = @ARTICULO

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[ACT_ARTICULOS_APP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [CEMACO].[ACT_ARTICULOS_APP](@ARTICULO VARCHAR(255),
										 @NOMBRE_NIDUX VARCHAR (MAX),
										 @DESCRIPCION_NIDUX VARCHAR (MAX),
										 @SHIPPING DECIMAL(28,8),
										 @PORCENTAJE DECIMAL(28,8),
										 @CARRITO VARCHAR (MAX),
										 @TIEMPO_GIF VARCHAR (MAX),
										 @VIDEO VARCHAR (MAX),
										 @NOMBRE_TRA VARCHAR (MAX),
										 @DESCRIP_TRADUC VARCHAR (MAX),
										 @DESCUENTO DECIMAL(28,8),
										 @ESTADO VARCHAR(255), 
										 @ACTIVO VARCHAR(2),
										 @INDICADOR VARCHAR(2), 
										 @DESTACADO VARCHAR(2), 
										 @RESERVA VARCHAR(2), 
										 @GIF VARCHAR(2), 
										 @TAGS VARCHAR(4000),
										 @SEO_TAGS VARCHAR(4000))
	AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ESTADO_ARTICULO INT
			SELECT @ESTADO_ARTICULO = ID FROM APLIX_ECOMERCE.CEMACO.ARTICULO_ESTADO WHERE DESCRIPCION = @ESTADO
			--SET @ARTICULO = '041932'
			UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS
				SET
					ESTADO = CONVERT(INT,@ESTADO_ARTICULO),
					ACTIVO = @ACTIVO,
					INDICADOR_STOCK = @INDICADOR,
					DESTACADO = @DESTACADO,
					PERMITE_RESERVA = @RESERVA,
					USAR_GIF = @GIF,
					NOMBRE_NIDUX = @NOMBRE_NIDUX,
					DESCRIPCION_NIDUX = @DESCRIPCION_NIDUX,
					COSTO_SHIPPING =  @SHIPPING,
					PORCENTAJE_RESERVA = @PORCENTAJE,
					LIMITE_CARRITO = CONVERT(INT, @CARRITO),
					GIF_TIEMPO = CONVERT(INT, @TIEMPO_GIF),
					VIDEO_YOUTUBE = @VIDEO,
					NOMBRE_TRADUC = @NOMBRE_TRA,
					DESCRIPCION_TRADUC = @DESCRIP_TRADUC,
					TAGS = @TAGS,
					SEO_TAGS = @SEO_TAGS
				WHERE ARTICULO = @ARTICULO

			UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS_PRECIO
				SET
					DESCUENTO = @DESCUENTO
				WHERE ARTICULO = @ARTICULO
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[ACT_ARTICULOS_EDITADOS_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [CEMACO].[ACT_ARTICULOS_EDITADOS_SIMPLE]
AS
	BEGIN
		SELECT AR.ID, AR.ARTICULO AS SKU,
			CASE 
				WHEN AR.NOMBRE_NIDUX IS NULL
				THEN AR.NOMBRE
				WHEN AR.NOMBRE_NIDUX = ''
				THEN AR.NOMBRE
				ELSE AR.NOMBRE_NIDUX END AS NOMBRE, 
			CASE 
				WHEN AR.DESCRIPCION_NIDUX IS NULL
				THEN AR.DESCRIPCION
				WHEN AR.DESCRIPCION_NIDUX = ''
				THEN AR.DESCRIPCION
				ELSE AR.DESCRIPCION_NIDUX END AS DESCRIPCION, AR.ACTIVO ,
			CASE
				WHEN MA.CODIGO_NIDUX IS NULL
				THEN CONVERT(VARCHAR,0)
				ELSE MA.CODIGO_NIDUX END AS ID_MARCA,
			CASE 
				WHEN AR.ID_CATEGORIAS IS NULL 
				THEN CONVERT(VARCHAR,0) 
				ELSE AR.ID_CATEGORIAS END AS ID_CATEGORIAS,
			  AP.PRECIO, AR.COSTO_SHIPPING, AR.PESO, AP.DESCUENTO,
			  CASE
			WHEN AR.ESTADO IS NULL THEN 3
			WHEN AR.ESTADO = '' THEN 3
			ELSE AR.ESTADO END AS ESTADO,
			AR.DESTACADO, AC.CANTIDAD, AR.VIDEO_YOUTUBE, AR.INDICADOR_STOCK, AR.PERMITE_RESERVA, AR.LIMITE_CARRITO, AR.PORCENTAJE_RESERVA,
			CASE 
				WHEN AR.USAR_GIF IS NULL THEN CONVERT(VARCHAR,0) 
				ELSE AR.USAR_GIF END USAR_GIF,
			CASE	
				WHEN AR.GIF_TIEMPO IS NULL THEN 0
				ELSE AR.GIF_TIEMPO END GIF_TIEMPO, 
			AR.ID_TRADUC AS ID_TRADUC, AR.NOMBRE_TRADUC AS NOMBRE_TRADUC, AR.DESCRIPCION_TRADUC as DESCRIPCION_TRADUC, AR.IMPUESTO, AR.TAGS, AR.SEO_TAGS
		FROM APLIX_ECOMERCE.CEMACO.ARTICULOS AR 
		FULL OUTER JOIN APLIX_ECOMERCE.CEMACO.MARCAS AS MA ON AR.ID_MARCA = MA.CODIGO_NIDUX
		INNER JOIN APLIX_ECOMERCE.CEMACO.ARTICULOS_PRECIO AS AP ON AR.ARTICULO = AP.ARTICULO
		INNER JOIN APLIX_ECOMERCE.CEMACO.ARTICULOS_CANTIDAD AS AC ON AR.ARTICULO = AC.ARTICULO
		WHERE AR.ACTIVO = 'S' AND AR.RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.CEMACO.CREDENCIALES WHERE ID = 1) 
		AND (AR.ID_PADRE IS NULL OR AR.ID_PADRE = '' OR AR.ARTICULO = AR.ID_PADRE) 
	END
GO
/****** Object:  StoredProcedure [CEMACO].[ACT_ATRIBUTOS_ARTICULOS_APP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ACT_ATRIBUTOS_ARTICULOS_APP](@ATRIBUTOS VARCHAR(255), @ARTICULO VARCHAR(255))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS
				SET
					ID_VALORES_ATRIBUTOS = @ATRIBUTOS
				WHERE ARTICULO = @ARTICULO

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[ACT_CANTIDAD_ARTICULOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ACT_CANTIDAD_ARTICULOS]
AS
	BEGIN
		SELECT AC.ARTICULO, AC.CANTIDAD FROM APLIX_ECOMERCE.CEMACO.ARTICULOS_CANTIDAD AS AC
			INNER JOIN APLIX_ECOMERCE.CEMACO.ARTICULOS AS AR ON AR.ARTICULO = AC.ARTICULO
			WHERE AC.RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.CEMACO.CREDENCIALES WHERE ID = 1) AND AR.ACTIVO = 'S'
	END
GO
/****** Object:  StoredProcedure [CEMACO].[ACT_CATEGORIAS_ARTICULO_APP_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ACT_CATEGORIAS_ARTICULO_APP_SIMPLE](@CATEGORIAS VARCHAR(255), @ARTICULO VARCHAR(255))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS
				SET
					ID_CATEGORIAS = @CATEGORIAS
				WHERE ARTICULO = @ARTICULO

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[ACT_ESTADO_ORDEN_PEDIDO]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ACT_ESTADO_ORDEN_PEDIDO]
AS
	BEGIN
		SELECT ORDERID FROM APLIX_ECOMERCE.CEMACO.PEDIDOS
			WHERE ESTADO_ORDEN = 'En proceso' AND RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.CEMACO.CREDENCIALES WHERE ID = 1)
	END
GO
/****** Object:  StoredProcedure [CEMACO].[ACT_FECHA_CONSULTA]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ACT_FECHA_CONSULTA](
   @FECHA DATETIME
)
AS
	BEGIN
		UPDATE CEMACO.CREDENCIALES
			SET
				FECHA_CONSULTA = CONVERT(DATETIME,@FECHA)
		WHERE ID = 1
	END
GO
/****** Object:  StoredProcedure [CEMACO].[ACT_ID_ARTICULOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ACT_ID_ARTICULOS](@SKU AS VARCHAR(50), @ID AS INT)
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		--actualizamos el id
		UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS
			SET
				ID = @ID
			WHERE ARTICULO = @SKU

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[ACT_MARCA_ARTICULO_APP_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ACT_MARCA_ARTICULO_APP_SIMPLE](@CODIGO_NIDUX INT, @ARTICULO VARCHAR(255))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS
				SET
					ID_MARCA = @CODIGO_NIDUX
				WHERE ARTICULO = @ARTICULO

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[ACT_PADRE_DATOS_APP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ACT_PADRE_DATOS_APP](@CODIGO VARCHAR(255), @ARTICULO VARCHAR(255))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS
				SET
					ID_PADRE = @CODIGO
				WHERE ARTICULO = @ARTICULO

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[ACT_PRECIO_ARTICULOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ACT_PRECIO_ARTICULOS]
AS
	BEGIN
		SELECT AP.ARTICULO, AP.PRECIO FROM APLIX_ECOMERCE.CEMACO.ARTICULOS_PRECIO AS AP
		INNER JOIN APLIX_ECOMERCE.CEMACO.ARTICULOS AS AR ON AP.ARTICULO = AR.ARTICULO
			WHERE AP.RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.CEMACO.CREDENCIALES WHERE ID = 1) AND AR.ACTIVO = 'S'
	END
GO
/****** Object:  StoredProcedure [CEMACO].[ACTUALIZAR_ARTICULOS_ELIMANADOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ACTUALIZAR_ARTICULOS_ELIMANADOS](@ARTICULO AS VARCHAR(255))
AS
	BEGIN
		UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS 
			SET ID = NULL
		WHERE ARTICULO = @ARTICULO
	END
GO
/****** Object:  StoredProcedure [CEMACO].[ACTUALIZAR_CATEGORIAS_APP_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ACTUALIZAR_CATEGORIAS_APP_SIMPLE](@NOMBRE VARCHAR(MAX), @DESCRIPCION VARCHAR(MAX), @CODIGO INT)
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE APLIX_ECOMERCE.CEMACO.CATEGORIAS
				SET
					NOMBRE = @NOMBRE,
					DESCRIPCION = @DESCRIPCION
				WHERE CODIGO_NIDUX = @CODIGO
			
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END	
GO
/****** Object:  StoredProcedure [CEMACO].[ACTUALIZAR_FILTRO_ARTICULOS_TP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [CEMACO].[ACTUALIZAR_FILTRO_ARTICULOS_TP]
@codigo_articulo int,
@nombre int,
@nombre_nidux int,
@descripcion int,
@descripcion_nidux int,
@peso int,
@cantidad int,
@precio int,
@porcentaje_descuento int,
@impuesto_articulo int,
@sincroniza int,
@estado int,
@id_nidux int,
@marca_nidux int,
@categorias int,
@valores_atributos int,
@id_padre int,
@id_hijo int,
@indicador_stock int,
@destacar_articulo int,
@costo_shipping int,
@permite_reserva int,
@porcentaje_reserva int,
@limite_carrito int,
@usa_gif int,
@tiempo_gif int,
@video_youtube int,
@nombre_ingles int,
@descripcion_ingles int 
AS
BEGIN
	UPDATE APLIX_ECOMERCE.CEMACO.FILTRO_ARTICULO_TABLAS_PROPIAS
	SET codigo_articulo			= @codigo_articulo,
		nombre					= @nombre,
		nombre_nidux			= @nombre_nidux,
		descripcion				= @descripcion,
		descripcion_nidux		= @descripcion_nidux,
		peso					= @peso,
		cantidad				= @cantidad,
		precio					= @precio,
		porcentaje_descuento	= @porcentaje_descuento,
		impuesto_articulo		= @impuesto_articulo,
		sincroniza				= @sincroniza,
		estado					= @estado,
		id_nidux				= @id_nidux,
		marca_nidux				= @marca_nidux,
		categorias				= @categorias,
		valores_atributos		= @valores_atributos,
		id_padre				= @id_padre,
		id_hijo					= @id_hijo,
		indicador_stock			= @indicador_stock,
		destacar_articulo		= @destacar_articulo,
		costo_shipping			= @costo_shipping,
		permite_reserva			= @permite_reserva,
		porcentaje_reserva		= @porcentaje_reserva,
		limite_carrito			= @limite_carrito,
		usa_gif					= @usa_gif,
		tiempo_gif				= @tiempo_gif,
		video_youtube			= @video_youtube,
		nombre_ingles			= @nombre_ingles,
		descripcion_ingles		= @descripcion_ingles
END 
GO
/****** Object:  StoredProcedure [CEMACO].[ACTUALIZAR_FILTRO_PEDIDOS_TP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [CEMACO].[ACTUALIZAR_FILTRO_PEDIDOS_TP]
@numero_orden int,
@nombre_cliente int,
@identificacion int,
@correo_cliente int,
@tel_fijo int,
@tel_movil int,
@comprador_anonimo int,
@monto_impuesto int,
@fecha int,
@order_gif int,
@estado_orden int,
@moneda int,
@observaciones int,
@cod_autorizacion int,
@ip_origen int,
@estado_pago int,
@medio_pago int,
@total_orden int, 
@uso_cupon int,
@tipo_cupon int,
@sucursal int, 
@recoger_sucursal int,
@metodo_pago int,
@moneda_facturacion int,
@tipo_envio int,
@costo_envio int,
@costo_impuesto_envio int,
@nombre_destinatario int,
@identificacion_envio int,
@tipo_identi_envio int,
@correo_envio int,
@telefono_envio int,
@tel_movil_envio int,
@pais_envio int, 
@provincia_envio int,
@canton_envio int,
@distrito_envio int, 
@detalle_direccion_envio int,
@ciudad_envio int,
@codigo_zip_envio int,
@posicion_latitud int,
@posicion_longitud int,
@nombre_destinatario_fac int,
@identificacion_fac int,
@tipo_id_fac int,
@correo_fac int,
@telefono_fac int,
@tel_movil_fac int,
@pais_fac int,
@provincia_fac int,
@canton_fac int,
@distrito_fac int,
@detalle_dir_fac int,
@ciudad_fac int,
@codigo_zip_fac int,
@posicion_latitud_fac int,
@posicion_longitud_fac int 
AS
BEGIN

	UPDATE APLIX_ECOMERCE.CEMACO.FILTRO_PEDIDOS_TABLAS_PROPIAS
	SET 
	numero_orden				= @numero_orden,
	nombre_cliente				= @nombre_cliente,
	identificacion				= @identificacion,
	correo_cliente				= @correo_cliente,
	tel_fijo					= @tel_fijo,
	tel_movil					= @tel_movil,
	comprador_anonimo			= @comprador_anonimo,
	monto_impuesto				= @monto_impuesto,
	fecha						= @fecha,
	order_gif					= @order_gif,
	estado_orden				= @estado_orden,
	moneda						= @moneda,
	observaciones				= @observaciones,
	cod_autorizacion			= @cod_autorizacion,
	ip_origen					= @ip_origen,
	estado_pago					= @estado_pago,
	medio_pago					= @medio_pago,
	total_orden					= @total_orden, 
	uso_cupon					= @uso_cupon,
	tipo_cupon					= @tipo_cupon,
	sucursal					= @sucursal, 
	recoger_sucursal			= @recoger_sucursal,
	metodo_pago					= @metodo_pago,
	moneda_facturacion			= @moneda_facturacion,
	tipo_envio					= @tipo_envio,
	costo_envio					= @costo_envio,
	costo_impuesto_envio		= @costo_impuesto_envio,
	nombre_destinatario			= @nombre_destinatario,
	identificacion_envio		= @identificacion_envio,
	tipo_identi_envio			= @tipo_identi_envio,
	correo_envio				= @correo_envio,
	telefono_envio				= @telefono_envio,
	tel_movil_envio				= @tel_movil_envio,
	pais_envio					= @pais_envio, 
	provincia_envio				= @provincia_envio,
	canton_envio				= @canton_envio,
	distrito_envio				= @distrito_envio, 
	detalle_direccion_envio		= @detalle_direccion_envio,
	ciudad_envio				= @ciudad_envio,
	codigo_zip_envio			= @codigo_zip_envio,
	posicion_latitud			= @posicion_latitud,
	posicion_longitud			= @posicion_longitud,
	nombre_destinatario_fac		= @nombre_destinatario_fac,
	identificacion_fac			= @identificacion_fac,
	tipo_id_fac					= @tipo_id_fac,
	correo_fac					= @correo_fac,
	telefono_fac				= @telefono_fac,
	tel_movil_fac				= @tel_movil_fac,
	pais_fac					= @pais_fac,
	provincia_fac				= @provincia_fac,
	canton_fac					= @canton_fac,
	distrito_fac				= @distrito_fac,
	detalle_dir_fac				= @detalle_dir_fac,
	ciudad_fac					= @ciudad_fac,
	codigo_zip_fac				= @codigo_zip_fac,
	posicion_latitud_fac		= @posicion_latitud_fac,
	posicion_longitud_fac		= @posicion_longitud_fac 
END
GO
/****** Object:  StoredProcedure [CEMACO].[ACTUALIZAR_MARCAS_APP_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ACTUALIZAR_MARCAS_APP_SIMPLE](@NOMBRE VARCHAR(255), @ID INT)
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE APLIX_ECOMERCE.CEMACO.MARCAS
				SET
					DESCRIPCION_NIDUX = @NOMBRE
				WHERE CODIGO_NIDUX = @ID
			
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END	
GO
/****** Object:  StoredProcedure [CEMACO].[ACTUALIZAR_MARCAS_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ACTUALIZAR_MARCAS_SIMPLE]
AS
	BEGIN
		SELECT DESCRIPCION_NIDUX, CODIGO_NIDUX FROM CEMACO.MARCAS WHERE RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.CEMACO.CREDENCIALES WHERE ID = 1)
	END
GO
/****** Object:  StoredProcedure [CEMACO].[ACTUALIZO_TOKEN_NIDUX]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ACTUALIZO EL TOKEN ERP
CREATE PROC [CEMACO].[ACTUALIZO_TOKEN_NIDUX](
	@TOKEN_NIDUX VARCHAR(MAX)
)
AS
BEGIN TRY
	UPDATE CEMACO.CREDENCIALES
	   SET TOKEN_NIDUX = @TOKEN_NIDUX,
		   FECHA_HORA_TOKEN = GETDATE()

	WHERE ID = 1
END TRY
	BEGIN CATCH
			INSERT INTO CEMACO.BITACORA_ERRORES_TABLAS_PROPIAS ( FECHA, PROCEDIMIENTO , ERROR) 
			VALUES (SYSDATETIME(), COALESCE(ERROR_PROCEDURE(), ''), 
			' Linea error: ' + CONVERT(VARCHAR(55),ERROR_LINE())+
			' Mensaje error: ' + ERROR_MESSAGE() +
			' Numero error: ' + CONVERT(VARCHAR(55),ERROR_NUMBER()) +  
			' Severity error: ' + CONVERT(VARCHAR(55),ERROR_SEVERITY()) +
			' Estado error: ' + CONVERT(VARCHAR(55),ERROR_STATE())
			)
	END CATCH

GO
/****** Object:  StoredProcedure [CEMACO].[ACTUALIZO_WISK_ID_SINCRONIZADO]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ACTUALIZO_WISK_ID_SINCRONIZADO](
	@ORDERID VARCHAR(20),
	@ESTADO  VARCHAR(2)
)
AS 
BEGIN
	IF EXISTS(SELECT ORDERID FROM CEMACO.PEDIDOS WHERE ORDERID = @ORDERID)
	BEGIN
		UPDATE CEMACO.PEDIDOS
		   SET WISK_ID_SINCRONIZADO = @ESTADO
		 WHERE ORDERID = @ORDERID
	END
END

GO
/****** Object:  StoredProcedure [CEMACO].[AGREGAR_ATRIBUTOS_ARTICULOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[AGREGAR_ATRIBUTOS_ARTICULOS](@ID_PADRE AS VARCHAR(255))
AS
	BEGIN
		DECLARE @LIST VARCHAR(200)
		SELECT @LIST = ID_VALORES_ATRIBUTOS FROM APLIX_ECOMERCE.CEMACO.ARTICULOS WHERE ID_PADRE = @ID_PADRE
		print @LIST
		SELECT VA.ID_ATRIBUTO, AA.DESCRIPCION FROM APLIX_ECOMERCE.CEMACO.VALORES_ATRIBUTOS AS VA 
			INNER JOIN APLIX_ECOMERCE.CEMACO.ATRIBUTOS AS AA on VA.ID_ATRIBUTO = AA.ID WHERE VA.ID IN (SELECT * FROM CEMACO.BUSCAR_VALORES_ATRIBUTOS(@LIST))
	END
GO
/****** Object:  StoredProcedure [CEMACO].[AGREGAR_PEDIDOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[AGREGAR_PEDIDOS](
@orderId int, @wish_id int, @cliente varchar(255), @identificacion varchar(15), @correo varchar(255), @telefono_fijo varchar(20), 
@telefono_movil varchar(20), @es_anonimo int, @monto_impuestos varchar(50), @fecha_orden varchar(25),
@orderGiftpointsUsed varchar(50), @estado_orden varchar(50), @moneda varchar(50), @observaciones varchar(500),
@codigo_autorizacion int, @ip_origen varchar(20), @estado_pago varchar(50), @medio_pago varchar(50),
@total varchar(50), @cuponUsado VARCHAR (50), @cuponTipo varchar(50), @sucursal varchar(50), @recoger_sucursal varchar(200), @codigo_metodo_pago varchar(200), @moneda_fe varchar(200),
@nombre_destinatario_envio varchar(255), @identificacion_envio varchar(15), @tipo_identificacion_envio varchar(150), @correo_envio varchar(255),
@telefono_envio varchar(20), @movil_envio varchar(20), @pais_envio varchar(50), @provincia_envio varchar(50), @canton_envio varchar(50), @distrito_envio varchar(50),
@detalle_direccion_envio varchar(500), @ciudad_envio varchar(100), @zip_envio varchar(10), @geo_latitud_envio varchar(255), @geo_longitud_envio varchar(255),
@nombre_destinatario_fac varchar(255), @identificacion_fac varchar(15), @tipo_identificacion_fac varchar(150), @correo_fac varchar(255),
@telefono_fac varchar(20), @movil_fac varchar(20), @pais_fac varchar(50), @provincia_fac varchar(50) ,@canton_fac varchar(50), @distrito_fac varchar(50),
@detalle_direccion_fac varchar(500), @ciudad_fac varchar(100), @zip_fac varchar(10), @geo_latitud_fac varchar(255), @geo_longitud_fac varchar(255),
@tipo_envio varchar(30), @costo_total_shipping varchar(100), @tasa_impuesto_shipping varchar(15)
)
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			
			IF NOT EXISTS(SELECT ORDERID FROM CEMACO.PEDIDOS WHERE ORDERID = @orderId)
			BEGIN 
			INSERT INTO APLIX_ECOMERCE.CEMACO.PEDIDOS ([ORDERID],[WISH_ID],[CLIENTE],[IDENTIFICACION],[CORREO],[TELEFONO_FIJO],[TELEFONO_MOVIL]

											   ,[ES_ANONIMO],[MONTO_IMPUESTOS],[FECHA_ORDEN],[ORDERGIFTPOINTSUSED],[ESTADO_ORDEN],[MONEDA]

											   ,[OBSERVACIONES],[CODIGO_AUTORIZACION],[IP_ORIGEN],[ESTADO_PAGO],[MEDIO_PAGO],[TOTAL]

											   ,[CUPONUSADO],[CUPONTIPO],[SUCURSAL],[RECOGER_SUCURSAL], [MONEDA_FE], [CODIGO_METODO_PAGO],[NOMBRE_DESTINATARIO_ENVIO],[IDENTIFICACION_ENVIO]

											   ,[TIPO_IDENTIFICACION_ENVIO],[CORREO_ENVIO],[TELEFONO_ENVIO],[MOVIL_ENVIO],[PAIS_ENVIO],[PROVINCIA_ENVIO]

											   ,[CANTON_ENVIO],[DISTRITO_ENVIO],[DETALLE_DIRECCION_ENVIO],[CIUDAD_ENVIO],[ZIP_ENVIO],[GEO_LATITUD_ENVIO]

											   ,[GEO_LONGITUD_ENVIO],[NOMBRE_DESTINATARIO_FAC],[IDENTIFICACION_FAC],[TIPO_IDENTIFICACION_FAC],[CORREO_FAC],[TELEFONO_FAC]

											   ,[MOVIL_FAC],[PAIS_FAC],[PROVINCIA_FAC],[CANTON_FAC],[DISTRITO_FAC],[DETALLE_DIRECCION_FAC]

											   ,[CIUDAD_FAC],[ZIP_FAC],[GEO_LATITUD_FAC],[GEO_LONGITUD_FAC]
											   
											   ,[TIPO_ENVIO], [COSTO_TOTAL_SHIPPING], [TASA_IMPUESTO_SHIPPING],WISK_ID_SINCRONIZADO) 
										
										VALUES (@orderId , @wish_id, @cliente , @identificacion , @correo , @telefono_fijo ,@telefono_movil , 

												@es_anonimo , @monto_impuestos , @fecha_orden ,@orderGiftpointsUsed , @estado_orden , @moneda , 

												@observaciones , @codigo_autorizacion , @ip_origen , @estado_pago , @medio_pago, @total , 
												
												@cuponUsado , @cuponTipo , @sucursal , @recoger_sucursal, @moneda_fe, @codigo_metodo_pago ,@nombre_destinatario_envio , @identificacion_envio , 
												
												@tipo_identificacion_envio , @correo_envio ,@telefono_envio , @movil_envio , @pais_envio , @provincia_envio,
												
												@canton_envio , @distrito_envio ,@detalle_direccion_envio , @ciudad_envio , @zip_envio , @geo_latitud_envio , 
												
												@geo_longitud_envio ,@nombre_destinatario_fac , @identificacion_fac , @tipo_identificacion_fac , @correo_fac ,@telefono_fac , 
												
												@movil_fac ,@pais_fac , @provincia_fac, @canton_fac, @distrito_fac , @detalle_direccion_fac , 
												
												@ciudad_fac , @zip_fac , @geo_latitud_fac , @geo_longitud_fac,
												
												@tipo_envio, @costo_total_shipping, @tasa_impuesto_shipping,'N')
			END

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			/*insert into bitacora */
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[AGREGAR_PEDIDOS_LINEA]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[AGREGAR_PEDIDOS_LINEA](
@orderId int, @id_producto int, @id_variacion int, @sku varchar(255), @nombre_producto varchar(255), @precio varchar(50), @cantidad int, @porcentaje_descuento varchar(255),
@subtotal_descuento varchar(255), @subtotal_linea varchar(255),@impuesto int, @subtotal_impuestos varchar(255))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

		IF NOT EXISTS(SELECT ORDERID FROM CEMACO.PEDIDOS_LINEA WHERE ORDERID = @orderId)
		BEGIN 

			INSERT INTO APLIX_ECOMERCE.CEMACO.PEDIDOS_LINEA ([ORDERID],[ID_PRODUCTO],[ID_VARIACION],[SKU]

													 ,[NOMBRE_PRODUCTO],[PRECIO],[CANTIDAD],[PORCENTAJE_DESCUENTO]

													 ,[SUBTOTAL_DESCUENTO],[SUBTOTAL_LINEA],[IMPUESTO],[SUBTOTAL_IMPUESTOS]) 
											  
											  VALUES (@orderId, @id_producto, @id_variacion, @sku, 

													  @nombre_producto, @precio, @cantidad, @porcentaje_descuento,

													  @subtotal_descuento, @subtotal_linea,@impuesto, @subtotal_impuestos)
		END

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			/*insert into bitacora */
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[AGREGAR_VALORES_ATRIBUTOS_ARTICULOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[AGREGAR_VALORES_ATRIBUTOS_ARTICULOS](@ID_PADRE AS VARCHAR(255))
AS
	BEGIN
		SELECT AR.ARTICULO, AR.ID_VALORES_ATRIBUTOS, AR.PESO, AC.CANTIDAD, AP.PRECIO
			FROM APLIX_ECOMERCE.CEMACO.ARTICULOS AS AR
			INNER JOIN APLIX_ECOMERCE.CEMACO.ARTICULOS_CANTIDAD AS AC ON AR.ARTICULO = AC.ARTICULO
			INNER JOIN APLIX_ECOMERCE.CEMACO.ARTICULOS_PRECIO AS AP ON AR.ARTICULO = AP.ARTICULO
			WHERE AR.ID_PADRE = @ID_PADRE AND AR.ACTIVO = 'S'
	END
GO
/****** Object:  StoredProcedure [CEMACO].[APX_CREDENCIALES_CONEXION_NIDUX]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------------------------------------------
--							Obtener credenciales de conexion
--							y validar el tiempo del token
--  SI EL TOKEN NO A CADUCADO MANDO EL TOKEN EN @MENSAJE SI YA CADUCO MANDO PEDIRTOKEN PARA PEDIRSELO A NIDUX
----------------------------------------------------------------------------------------------------
CREATE PROC [CEMACO].[APX_CREDENCIALES_CONEXION_NIDUX]
AS
BEGIN TRY
	--OBTENGO LA FECHA ACTUAL
	DECLARE @FECHAACTUAL	DATETIME	 = GETDATE()
	--SELECCIONA EL ULTIMO DATO DE LA FECHA REGISTRADO CON EL TOP(1)
	DECLARE @FECHACONSULTA  DATETIME	 = (SELECT TOP(1) FECHA_HORA_TOKEN FROM CEMACO.CREDENCIALES ORDER BY FECHA_HORA_TOKEN DESC)
	--LE SUMO 1 HORA A LA FECHA EN LA QUE SOLICITE EL TOKEN PARA NO SOLICITARLO CADA VEZ QUE HAGO UNA CONSULTA A NIDUX
	DECLARE @HORACADUCIDAD  DATETIME	 = DATEADD(HOUR, 1, @FECHACONSULTA)
	DECLARE @MENSAJE		VARCHAR(MAX) = ''

	--valido que la fechaactual sea mayor o menor a la que se realizo la consulta
	IF(@FECHAACTUAL > @HORACADUCIDAD)
	BEGIN
			SET	@MENSAJE = 'NOT TODAY'
	--	 SELECT @MENSAJE
	END
	ELSE 
	BEGIN 
			SET	@MENSAJE = 'ADELANTE'
	--	 SELECT @MENSAJE
	END

	--Dependiendo del mensaje generado en el if anterior paso las credenciales para volver a pedir el token o no 
	IF(@MENSAJE = 'ADELANTE')
		BEGIN
			--Le paso el token a la variable mensaje
			SET @MENSAJE = (SELECT TOKEN_NIDUX FROM CEMACO.CREDENCIALES WHERE ID = 1)
			SELECT USUARIO, CONTRASENA, STOREID, @MENSAJE AS MENSAJE FROM CEMACO.CREDENCIALES WHERE ID = 1
		END
	ELSE
	BEGIN
		SET @MENSAJE = 'PEDIRTOKEN'
		SELECT USUARIO, CONTRASENA, STOREID, @MENSAJE AS MENSAJE FROM CEMACO.CREDENCIALES WHERE ID = 1
	END
END TRY
BEGIN CATCH
INSERT INTO CEMACO.BITACORA_ERRORES_TABLAS_PROPIAS ( FECHA, PROCEDIMIENTO , ERROR) 
			VALUES (SYSDATETIME(), COALESCE(ERROR_PROCEDURE(), ''), 
			' Linea error: ' + CONVERT(VARCHAR(55),ERROR_LINE())+
			' Mensaje error: ' + ERROR_MESSAGE() +
			' Numero error: ' + CONVERT(VARCHAR(55),ERROR_NUMBER()) +  
			' Severity error: ' + CONVERT(VARCHAR(55),ERROR_SEVERITY()) +
			' Estado error: ' + CONVERT(VARCHAR(55),ERROR_STATE())
			)
END CATCH
GO
/****** Object:  StoredProcedure [CEMACO].[APX_FECHA_ACTUAL]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[APX_FECHA_ACTUAL]
AS

	SELECT GETDATE() AS FECHA
GO
/****** Object:  StoredProcedure [CEMACO].[CARGAR_ARTICULOS_APP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [CEMACO].[CARGAR_ARTICULOS_APP]
AS
	BEGIN
		SELECT AR.ARTICULO,AR.NOMBRE, AR.NOMBRE_NIDUX, AR.DESCRIPCION, AR.DESCRIPCION_NIDUX, AR.PESO,AR.ACTIVO,AR.ESTADO,AR.ID,AR.ID_MARCA,AR.ID_CATEGORIAS,AR.ID_VALORES_ATRIBUTOS,AR.ID_PADRE,AR.ID_HIJO,
            AR.INDICADOR_STOCK,AR.DESTACADO,AR.COSTO_SHIPPING,AR.PERMITE_RESERVA,AR.PORCENTAJE_RESERVA,AR.LIMITE_CARRITO,AR.USAR_GIF,AR.GIF_TIEMPO,AR.VIDEO_YOUTUBE,
            AR.NOMBRE_TRADUC,AR.DESCRIPCION_TRADUC, AR.PESO, AC.CANTIDAD, AP.PRECIO, AP.DESCUENTO, AR.IMPUESTO , TAGS, SEO_TAGS
			FROM APLIX_ECOMERCE.CEMACO.ARTICULOS AR 
			INNER JOIN APLIX_ECOMERCE.CEMACO.ARTICULOS_CANTIDAD AS AC ON AR.ARTICULO = AC.ARTICULO 
            INNER JOIN APLIX_ECOMERCE.CEMACO.ARTICULOS_PRECIO AS AP ON AR.ARTICULO = AP.ARTICULO WHERE AR.ACTIVO = 'S'
	END
GO
/****** Object:  StoredProcedure [CEMACO].[CONSULTO_ARTICULOS_LISTAS_REGALO_EDITADAS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [CEMACO].[CONSULTO_ARTICULOS_LISTAS_REGALO_EDITADAS]
AS
BEGIN
	SELECT [WISH_ID],				
		   [PRODUCT_CODE],		
		   [STOCK]
  FROM [CEMACO].[LISTA_REGALOS_ARTICULOS]
	 WHERE --SINCRONIZADO = 'N' 
		--OR 
		FECHA_CAMBIO > (SELECT FECHA_CONSULTA FROM CEMACO.CREDENCIALES)
END
GO
/****** Object:  StoredProcedure [CEMACO].[CONSULTO_ARTICULOS_LISTAS_REGALO_NUEVAS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [CEMACO].[CONSULTO_ARTICULOS_LISTAS_REGALO_NUEVAS]
(
	@WISH_ID VARCHAR(100)
)
AS
BEGIN
	SELECT [WISH_ID],				
		   [PRODUCT_CODE],	
		   PRODUCT_NAME,
		   [STOCK]
	  FROM [CEMACO].[LISTA_REGALOS_ARTICULOS]
	 WHERE WISH_ID = @WISH_ID
END
GO
/****** Object:  StoredProcedure [CEMACO].[CONSULTO_DETALLE_LISTAS_REGALO_NUEVAS_EDITADAS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [CEMACO].[CONSULTO_DETALLE_LISTAS_REGALO_NUEVAS_EDITADAS]
AS
BEGIN
	 SELECT [WISH_ID],
			[EXTRA_OWNER_ID],
			[MODE_LIST],
		    [EVENTDATE],
		    [OWNER_ID],
			[ID_ECOFRIENDLY]
      FROM [CEMACO].[LISTA_REGALOS_DETALLES]
	 WHERE SINCRONIZADO = 'N' OR FECHA_CAMBIO > (SELECT FECHA_CONSULTA FROM CEMACO.CREDENCIALES)
END
GO
/****** Object:  StoredProcedure [CEMACO].[CONSULTO_ID_LISTA_REGALOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [CEMACO].[CONSULTO_ID_LISTA_REGALOS]
AS
BEGIN
	SELECT WISH_ID FROM CEMACO.LISTA_REGALOS_DETALLES
	WHERE SINCRONIZADO = 'N'
END
GO
/****** Object:  StoredProcedure [CEMACO].[CREDENCIALES_CONEXION]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[CREDENCIALES_CONEXION]
AS
	BEGIN
		SELECT USUARIO, CONTRASENA, STOREID FROM APLIX_ECOMERCE.CEMACO.CREDENCIALES WHERE ID = 1
	END
GO
/****** Object:  StoredProcedure [CEMACO].[DESACTIVAR_ARTICULOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[DESACTIVAR_ARTICULOS]
(
	@ARTICULO VARCHAR(200)
)
AS
	UPDATE CEMACO.ARTICULOS
	   SET ACTIVO = 'N'
	 WHERE ARTICULO = @ARTICULO
GO
/****** Object:  StoredProcedure [CEMACO].[ELIMINAR_ARTICULOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ELIMINAR_ARTICULOS]
AS
	BEGIN
		SELECT ARTICULO FROM APLIX_ECOMERCE.CEMACO.ARTICULOS WHERE ACTIVO = 'N' AND RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.CEMACO.CREDENCIALES WHERE ID = 1)
	END
GO
/****** Object:  StoredProcedure [CEMACO].[ELIMINAR_ARTICULOS_PADRES]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ELIMINAR_ARTICULOS_PADRES]
AS
	BEGIN
		SELECT ARTICULO FROM APLIX_ECOMERCE.CEMACO.ARTICULOS 
			WHERE RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.CEMACO.CREDENCIALES WHERE ID = 1)
			AND ID IS NOT NULL AND ARTICULO != ID_PADRE AND ACTIVO = 'S'
	END
GO
/****** Object:  StoredProcedure [CEMACO].[ELIMINAR_CATEGORIAS_ARTICULO_APP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Elimina categorias
CREATE PROC [CEMACO].[ELIMINAR_CATEGORIAS_ARTICULO_APP](@CODIGO AS INT)
AS
	BEGIN
		DELETE FROM APLIX_ECOMERCE.CEMACO.CATEGORIAS WHERE CODIGO_NIDUX = @CODIGO
	END
GO
/****** Object:  StoredProcedure [CEMACO].[ELIMINAR_MARCAS_ARTICULO_APP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ELIMINAR_MARCAS_ARTICULO_APP](@CODIGO AS INT)
AS
	BEGIN
		DELETE FROM APLIX_ECOMERCE.CEMACO.MARCAS WHERE CODIGO_NIDUX = @CODIGO
	END
GO
/****** Object:  StoredProcedure [CEMACO].[ELIMINAR_VALORES_ATRIBUTOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[ELIMINAR_VALORES_ATRIBUTOS]
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DELETE FROM APLIX_ECOMERCE.CEMACO.VALORES_ATRIBUTOS 

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[INSERTA_ARTICULOS_LISTA_REGALO]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [CEMACO].[INSERTA_ARTICULOS_LISTA_REGALO]
(
	@WISH_ID				INT,
	@ID						INT,
	@PRODUCT_NAME			VARCHAR(MAX),
	@PRODUCT_CODE			INT,
	@PRODUCT_PRICE			DECIMAL(28,8),
	@PRODUCT_SALE			DECIMAL(28,8),
	@PRODUCT_TAX			DECIMAL(28,8),
	@PRODUCT_TYPE			DECIMAL(28,8),
	@FECHA_CAMBIO			VARCHAR(50),
	@WISHED_AMOUNT			INT,
	@PRODUCT_VARIATION_ID	INT,
	@GIVEN					INT,
	@BUYERS_DETAILS			INT,
	@ADDBY					INT,
	@FAVORITE				INT,
	@STOCK					INT,
	@STATUS					INT,
	@PRODUCT_URL			VARCHAR(MAX),
	@SELECTABLEAMOUNT		INT,
	@CALCULATED_TOTAL		DECIMAL(28,8),
	@FINAL_PRICE			DECIMAL(28,8),
	@OLD_PRICE				DECIMAL(28,8)
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			IF NOT EXISTS(SELECT WISH_ID FROM CEMACO.LISTA_REGALOS_ARTICULOS WHERE WISH_ID = @WISH_ID AND ID_ARTICULO = @ID)
			BEGIN
				INSERT INTO CEMACO.LISTA_REGALOS_ARTICULOS
							(
							 ID_ARTICULO,	PRODUCT_NAME,		PRODUCT_CODE,		PRODUCT_PRICE,		PRODUCT_SALE, 
							 PRODUCT_TAX,	PRODUCT_TYPE,		FECHA_CAMBIO,		WISHED_AMOUNT,		PRODUCT_VARIATION_ID,
							 GIVEN,			BUYERS_DETAILS,		ADDBY,				FAVORITE,			STOCK,				
							 STATUS,		PRODUCT_URL,		SELECTABLEAMOUNT,	CALCULATED_TOTAL,	FINAL_PRICE,			
							 OLD_PRICE,		WISH_ID,			RECORDDATE,			SINCRONIZADO		
							)						
					  VALUES(				
							 @ID,			@PRODUCT_NAME,		@PRODUCT_CODE,		@PRODUCT_PRICE,		@PRODUCT_SALE,			
							 @PRODUCT_TAX,	@PRODUCT_TYPE,		@FECHA_CAMBIO,		@WISHED_AMOUNT,		@PRODUCT_VARIATION_ID,	
							 @GIVEN,		@BUYERS_DETAILS,	@ADDBY,				@FAVORITE,			@STOCK,					
							 @STATUS,		@PRODUCT_URL,		@SELECTABLEAMOUNT,	@CALCULATED_TOTAL,	@FINAL_PRICE,			
							 @OLD_PRICE,	@WISH_ID,			GETDATE(),			'N'			
							)
			END
			ELSE
			BEGIN
				UPDATE CEMACO.LISTA_REGALOS_ARTICULOS
				   SET ID_ARTICULO			= @ID,						
					   PRODUCT_NAME			= @PRODUCT_NAME,			
					   PRODUCT_CODE			= @PRODUCT_CODE,			
					   PRODUCT_PRICE		= @PRODUCT_PRICE,			
					   PRODUCT_SALE			= @PRODUCT_SALE,			
					   PRODUCT_TAX			= @PRODUCT_TAX,			
					   PRODUCT_TYPE			= @PRODUCT_TYPE,			
					   FECHA_CAMBIO			= @FECHA_CAMBIO,		
					   WISHED_AMOUNT		= @WISHED_AMOUNT,			
					   PRODUCT_VARIATION_ID	= @PRODUCT_VARIATION_ID,	
					   GIVEN				= @GIVEN,					
					   BUYERS_DETAILS		= @BUYERS_DETAILS,			
					   ADDBY				= @ADDBY,					
					   FAVORITE				= @FAVORITE,				
					   STOCK				= @STOCK,					
					   STATUS				= @STATUS,					
					   PRODUCT_URL			= @PRODUCT_URL,			
					   SELECTABLEAMOUNT		= @SELECTABLEAMOUNT,		
					   CALCULATED_TOTAL		= @CALCULATED_TOTAL,	
					   FINAL_PRICE			= @FINAL_PRICE,			
					   OLD_PRICE			= @OLD_PRICE,				
					   WISH_ID				= @WISH_ID,
					   RECORDDATE			= GETDATE(),
					   SINCRONIZADO			= 'N'
					   WHERE WISH_ID = @WISH_ID AND ID_ARTICULO = @ID AND RECORDDATE <= CONVERT(DATETIME,FECHA_CAMBIO)
			END
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
	            @ErrorSeverity INT,    
	            @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
END
GO
/****** Object:  StoredProcedure [CEMACO].[INSERTA_LISTA_REGALOS_DETALLES]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [CEMACO].[INSERTA_LISTA_REGALOS_DETALLES]
(
	@WISH_ID							INT,
	@ID_SHIPPING						INT,
	@DETAILS_SHIPPING					VARCHAR(MAX),
	@EVENTDATE							VARCHAR(100),
	@ID_STATUS							INT,
	@DETAILS_STATUS						VARCHAR(MAX),
	@OWNER_ID							INT,
	@CONSUMER_IDENTIFICATION			VARCHAR(100),
	@FECHA_CAMBIO						VARCHAR(100),
	@EXTRA_RECIPIENTS					VARCHAR(10),
	@THANKS_MSG							VARCHAR(MAX),
	@PUBLIC_MSG							VARCHAR(MAX),
	@MODE_LIST							VARCHAR(10),
	@USER_DIRECCION						INT,
	@LISTNAME							VARCHAR(MAX),
	@RANDOM_CODE						VARCHAR(100),
	@APPROVED_SHIPPING					INT,
	@EXTRA_OWNER_ID						INT,
	@ID_LIST_TYPE						INT,
	@DETAILS_LIST_TYPE					VARCHAR(MAX),
	@ID_ECOFRIENDLY						INT,
	@DETAILS_ECOFRINDLY					VARCHAR(MAX),
	@ID_ENABLE_ANONYMOUS_BUYER			INT,
	@DETAILS_ENABLE_ANONYMOUS_BUYER		VARCHAR(MAX),
	@ID_ENABLE_EXTRA_PRODUCTS_BUY		INT,
	@DETAILS_ENABLE_EXTRA_PRODUCTS_BUY	VARCHAR(MAX)
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			IF NOT EXISTS(SELECT WISH_ID FROM CEMACO.LISTA_REGALOS_DETALLES WHERE WISH_ID = @WISH_ID)
			BEGIN
				INSERT INTO CEMACO.LISTA_REGALOS_DETALLES
							( WISH_ID,							 ID_SHIPPING,			DETAILS_SHIPPING,				EVENTDATE,							ID_STATUS						--1	
							 ,DETAILS_STATUS,					 OWNER_ID,				CONSUMER_IDENTIFICATION,		FECHA_CAMBIO,						EXTRA_RECIPIENTS				--2	
							 ,THANKS_MSG,						 PUBLIC_MSG,			MODE_LIST,						USER_DIRECCION,						LISTNAME						--3
							 ,RANDOM_CODE,						 APPROVED_SHIPPING,		EXTRA_OWNER_ID,					ID_LIST_TYPE,						DETAILS_LIST_TYPE				--4	
							 ,ID_ECOFRIENDLY,					 DETAILS_ECOFRINDLY,	ID_ENABLE_ANONYMOUS_BUYER,		DETAILS_ENABLE_ANONYMOUS_BUYER,		ID_ENABLE_EXTRA_PRODUCTS_BUY	--5	
							 ,DETAILS_ENABLE_EXTRA_PRODUCTS_BUY, RECORDDATE,			SINCRONIZADO																						--6
							)
					  VALUES(
							  @WISH_ID,							  @ID_SHIPPING,			@DETAILS_SHIPPING,				CONVERT(DATETIME,@EVENTDATE),		@ID_STATUS						--1			
							 ,@DETAILS_STATUS,					  @OWNER_ID,			@CONSUMER_IDENTIFICATION,		CONVERT(DATETIME,@FECHA_CAMBIO),	@EXTRA_RECIPIENTS				--2	
							 ,@THANKS_MSG,						  @PUBLIC_MSG,			@MODE_LIST,						@USER_DIRECCION,					@LISTNAME						--3
							 ,@RANDOM_CODE,						  @APPROVED_SHIPPING,	@EXTRA_OWNER_ID,				@ID_LIST_TYPE,						@DETAILS_LIST_TYPE				--4	
							 ,@ID_ECOFRIENDLY,					  @DETAILS_ECOFRINDLY,	@ID_ENABLE_ANONYMOUS_BUYER,		@DETAILS_ENABLE_ANONYMOUS_BUYER,	@ID_ENABLE_EXTRA_PRODUCTS_BUY	--5	
							 ,@DETAILS_ENABLE_EXTRA_PRODUCTS_BUY, GETDATE(),			'N'																									--6
							)
			END
			ELSE
			BEGIN
				UPDATE CEMACO.LISTA_REGALOS_DETALLES
				   SET ID_SHIPPING						 = @ID_SHIPPING,
					   DETAILS_SHIPPING					 = @DETAILS_SHIPPING,
					   EVENTDATE						 = CONVERT(DATETIME,@EVENTDATE),
					   ID_STATUS						 = @ID_STATUS,
					   DETAILS_STATUS					 = @DETAILS_STATUS,
					   OWNER_ID							 = @OWNER_ID,
					   CONSUMER_IDENTIFICATION			 = @CONSUMER_IDENTIFICATION,
					   FECHA_CAMBIO						 = CONVERT(DATETIME,@FECHA_CAMBIO),
					   EXTRA_RECIPIENTS					 = @EXTRA_RECIPIENTS,
					   THANKS_MSG						 = @THANKS_MSG,
					   PUBLIC_MSG						 = @PUBLIC_MSG,
					   MODE_LIST						 = @MODE_LIST,
					   USER_DIRECCION					 = @USER_DIRECCION,
					   LISTNAME							 = @LISTNAME,
					   RANDOM_CODE						 = @RANDOM_CODE,
					   APPROVED_SHIPPING				 = @APPROVED_SHIPPING,
					   EXTRA_OWNER_ID					 = @EXTRA_OWNER_ID,
					   ID_LIST_TYPE						 = @ID_LIST_TYPE,
					   DETAILS_LIST_TYPE				 = @DETAILS_LIST_TYPE,
					   ID_ECOFRIENDLY					 = @ID_ECOFRIENDLY,
					   DETAILS_ECOFRINDLY				 = @DETAILS_ECOFRINDLY,
					   ID_ENABLE_ANONYMOUS_BUYER		 = @ID_ENABLE_ANONYMOUS_BUYER,
					   DETAILS_ENABLE_ANONYMOUS_BUYER	 = @DETAILS_ENABLE_ANONYMOUS_BUYER,
					   ID_ENABLE_EXTRA_PRODUCTS_BUY		 = @ID_ENABLE_EXTRA_PRODUCTS_BUY,
					   DETAILS_ENABLE_EXTRA_PRODUCTS_BUY = @DETAILS_ENABLE_EXTRA_PRODUCTS_BUY,
					   RECORDDATE						 = GETDATE(),
					   SINCRONIZADO						 = 'N'
					   WHERE WISH_ID = @WISH_ID AND RECORDDATE <= CONVERT(DATETIME,FECHA_CAMBIO)
			END
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
	            @ErrorSeverity INT,    
	            @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
END
GO
/****** Object:  StoredProcedure [CEMACO].[INSERTAR_ARTICULOS_CODISA]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [CEMACO].[INSERTAR_ARTICULOS_CODISA](@ARTICULO VARCHAR(255), @NOMBRE VARCHAR(MAX), @DESCRIPCION VARCHAR(MAX), @PESO DECIMAL(28,8), @IMPUESTO DECIMAL(28,8), @CANTIDAD DECIMAl(28,8),
										   @PRECIO DECIMAL(28,8), @DESCUENTO DECIMAL(28,8), @CATEGORIAS VARCHAR(MAX), @ESTADO INT, @MARCA VARCHAR(MAX), @DESTACADO VARCHAR(2),  @TAGS VARCHAR(MAX), @SEOTAG VARCHAR(MAX),
										   @VIDEO VARCHAR(MAX), @RECORDDATE DATETIME)
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			IF((SELECT ARTICULO FROM APLIX_ECOMERCE.CEMACO.ARTICULOS WHERE ARTICULO = @ARTICULO) IS NULL)
				BEGIN

					--ARTICULO
					INSERT INTO APLIX_ECOMERCE.CEMACO.ARTICULOS (ARTICULO, NOMBRE, DESCRIPCION, PESO, IMPUESTO, ACTIVO, 
																
																ID_CATEGORIAS, ESTADO, ID_MARCA, DESTACADO, TAGS, SEO_TAGS, VIDEO_YOUTUBE, RECORDDATE) --

												  VALUES (@ARTICULO, @NOMBRE, @DESCRIPCION, @PESO, @IMPUESTO, 'S',
												  
														  @CATEGORIAS, @ESTADO, @MARCA, @DESTACADO, @TAGS, @SEOTAG, @VIDEO, GETDATE())-- todos los articulos lo vamos a poner como activos
					
					--CANTIDAD
					INSERT INTO APLIX_ECOMERCE.CEMACO.ARTICULOS_CANTIDAD (ARTICULO, CANTIDAD, RECORDDATE)

												  VALUES (@ARTICULO, @CANTIDAD, GETDATE())--
					--PRECIO
					INSERT INTO APLIX_ECOMERCE.CEMACO.ARTICULOS_PRECIO (ARTICULO, PRECIO, DESCUENTO, RECORDDATE)--

												 VALUES (@ARTICULO, @PRECIO, @DESCUENTO, GETDATE())--
				END
			ELSE
				BEGIN
					
					--ARTICULO
					UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS
						SET
							NOMBRE = @NOMBRE,
							DESCRIPCION = @DESCRIPCION,
							PESO = @PESO,
							IMPUESTO = @IMPUESTO,
							ID_CATEGORIAS = @CATEGORIAS,
							ESTADO = @ESTADO,
							ID_MARCA = @MARCA,
							DESTACADO = @DESTACADO,
							TAGS = @TAGS,
							SEO_TAGS = @SEOTAG,
							VIDEO_YOUTUBE = @VIDEO + '',
							RECORDDATE = @RECORDDATE
						WHERE ARTICULO = @ARTICULO
						  AND @RECORDDATE >= (SELECT FECHA_CONSULTA FROM CEMACO.CREDENCIALES)

					--CANTIDAD
					UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS_CANTIDAD
						SET
							CANTIDAD = @CANTIDAD,
							RECORDDATE = @RECORDDATE
						WHERE ARTICULO = @ARTICULO
						  AND @RECORDDATE >= (SELECT FECHA_CONSULTA FROM CEMACO.CREDENCIALES)

					--PRECIO
					UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS_PRECIO
						SET
							PRECIO = @PRECIO,
							DESCUENTO = @DESCUENTO,
							RECORDDATE = @RECORDDATE
						WHERE ARTICULO = @ARTICULO
						  AND @RECORDDATE >= (SELECT FECHA_CONSULTA FROM CEMACO.CREDENCIALES)

				END
						
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[INSERTAR_ARTICULOS_POR_EXCEL]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [CEMACO].[INSERTAR_ARTICULOS_POR_EXCEL]
(
@SKU AS VARCHAR(250),
@NOMBRE_NIDUX AS VARCHAR(MAX),
@DESCRIPCION_NIDUX AS VARCHAR(MAX),
@MARCA AS VARCHAR(200),
@CATEGORIA AS VARCHAR(200),
@PORCENTAJE_RESERVA AS VARCHAR(200),
@PERMITE_RESERVA AS VARCHAR(10),
@DESTACADO AS VARCHAR(10),
@INDICADOR_STOCK AS VARCHAR(10),
@ESTADO AS VARCHAR(5),
@COSTO_SHIPPING AS VARCHAR(200),
@LIMITE_CARRITO AS VARCHAR(100),
@USAR_GIF AS VARCHAR(200),
@TIEMPO_GIF AS VARCHAR(200),
@NOMBRE_TRADUCCION AS VARCHAR(MAX),
@DESCRIPCION_TRADUCCION AS VARCHAR(MAX),
@SINCRONIZA AS VARCHAR(2),
@TAGS AS VARCHAR(4000),
@SEO_TAGS AS VARCHAR(4000)
)
AS
BEGIN

IF ((SELECT ARTICULO FROM APLIX_ECOMERCE.CEMACO.ARTICULOS_PRECIO WHERE ARTICULO = @SKU) IS NULL)
BEGIN
INSERT INTO APLIX_ECOMERCE.CEMACO.ARTICULOS_PRECIO (ARTICULO, PRECIO, DESCUENTO)
VALUES (@SKU, 0 , 0)
END

IF ((SELECT ARTICULO FROM APLIX_ECOMERCE.CEMACO.ARTICULOS_CANTIDAD WHERE ARTICULO = @SKU) IS NULL)
BEGIN
INSERT INTO APLIX_ECOMERCE.CEMACO.ARTICULOS_CANTIDAD(ARTICULO, CANTIDAD)
VALUES (@SKU, 0)
END


IF ((SELECT ARTICULO FROM APLIX_ECOMERCE.CEMACO.ARTICULOS WHERE ARTICULO = @SKU) IS NULL )
BEGIN
INSERT INTO APLIX_ECOMERCE.CEMACO.ARTICULOS
(ARTICULO, NOMBRE_NIDUX, DESCRIPCION_NIDUX, ID_MARCA, ID_CATEGORIAS, 

PORCENTAJE_RESERVA, PERMITE_RESERVA, DESTACADO, INDICADOR_STOCK, ESTADO, 

COSTO_SHIPPING, LIMITE_CARRITO, USAR_GIF, GIF_TIEMPO, NOMBRE_TRADUC, 

DESCRIPCION_TRADUC, ACTIVO, TAGS, SEO_TAGS)

VALUES (

@SKU, @NOMBRE_NIDUX, @DESCRIPCION_NIDUX, @MARCA, @CATEGORIA,

@PORCENTAJE_RESERVA, @PERMITE_RESERVA, @DESTACADO, @INDICADOR_STOCK, @ESTADO, 

@COSTO_SHIPPING, @LIMITE_CARRITO, @USAR_GIF, @TIEMPO_GIF, @NOMBRE_TRADUCCION,

@DESCRIPCION_TRADUCCION, @SINCRONIZA, @TAGS, @SEO_TAGS

)

END
ELSE 
BEGIN
UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS SET 

NOMBRE_NIDUX			= @NOMBRE_NIDUX,
DESCRIPCION_NIDUX		= @DESCRIPCION_NIDUX,
ID_MARCA				= @MARCA,
ID_CATEGORIAS			= @CATEGORIA,
PORCENTAJE_RESERVA		= @PORCENTAJE_RESERVA,
PERMITE_RESERVA			= @PERMITE_RESERVA,
DESTACADO				= @DESTACADO,
INDICADOR_STOCK			= @INDICADOR_STOCK,
ESTADO					= @ESTADO,
COSTO_SHIPPING			= @COSTO_SHIPPING,
LIMITE_CARRITO			= @LIMITE_CARRITO,
USAR_GIF				= @USAR_GIF,
GIF_TIEMPO				= @TIEMPO_GIF,
NOMBRE_TRADUC			= @NOMBRE_TRADUCCION,
DESCRIPCION_TRADUC		= @DESCRIPCION_TRADUCCION,
ACTIVO					= @SINCRONIZA,
TAGS					= @TAGS,
SEO_TAGS				= @SEO_TAGS
WHERE ARTICULO = @SKU

END

END
GO
/****** Object:  StoredProcedure [CEMACO].[INSERTAR_ARTICULOS_TIENDA_APP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[INSERTAR_ARTICULOS_TIENDA_APP](@ID VARCHAR(255), @ID_MARCA VARCHAR(255), @SKU VARCHAR(255), @NOMBRE VARCHAR(MAX), 
										 @DESCRIPCION VARCHAR(MAX), @PRECIO VARCHAR(255), @COSTO_SHIPPING VARCHAR(255), @PESO VARCHAR(255), 
										 @OFERTA VARCHAR(255), @ESTADO VARCHAR(255), @DESTACADO VARCHAR(255), @STOCK INT,
										 @VIDEO VARCHAR(255), @INDICADOR VARCHAR(255), @RESERVA VARCHAR(255), @CARRITO VARCHAR(255), 
										 @POR_RESERVA VARCHAR(255), @USAR_GIF VARCHAR(255), @TIEMPO_GIF VARCHAR(255), @CATEGORIAS VARCHAR(255), 
										 @LANG_NOMBRE VARCHAR(255), @LANG_DESCRIP VARCHAR(255), @IMPUESTO VARCHAR(255), @TAGS VARCHAR(4000), @SEO_TAGS VARCHAR(4000))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			--seteamos las variables para sus nuevo valores
			IF @INDICADOR = '1'
				BEGIN
					SET @INDICADOR = 'S'
				END
			ELSE
				BEGIN
					SET @INDICADOR = 'N'
				END

			IF @DESTACADO = '1'
				BEGIN
					SET @DESTACADO = 'S'
				END
			ELSE
				BEGIN
					SET @DESTACADO = 'N'
				END

			IF @RESERVA = '1'
				BEGIN
					SET @RESERVA = 'S'
				END
			ELSE
				BEGIN
					SET @RESERVA = 'N'
				END

			IF @USAR_GIF = '1'
				BEGIN
					SET @USAR_GIF = 'S'
				END
			ELSE
				BEGIN
					SET @USAR_GIF = 'N'
				END

			IF((SELECT ARTICULO FROM APLIX_ECOMERCE.CEMACO.ARTICULOS WHERE ARTICULO = @SKU) IS NULL)
				BEGIN
					--insertamos en la tabla articulos
					INSERT INTO APLIX_ECOMERCE.CEMACO.ARTICULOS(ARTICULO, NOMBRE, DESCRIPCION, PESO, ACTIVO, ESTADO, ID,
												 
														 ID_MARCA, ID_CATEGORIAS, ID_VALORES_ATRIBUTOS, ID_PADRE,
												 
														 ID_HIJO, INDICADOR_STOCK, DESTACADO, COSTO_SHIPPING,
												 
														 PERMITE_RESERVA, PORCENTAJE_RESERVA, LIMITE_CARRITO,
												 
														 USAR_GIF, GIF_TIEMPO, VIDEO_YOUTUBE, ID_TRADUC, NOMBRE_TRADUC,
												 
														 DESCRIPCION_TRADUC,NOMBRE_NIDUX, DESCRIPCION_NIDUX, IMPUESTO , TAGS, SEO_TAGS) 
			
												  VALUES(@SKU, @NOMBRE, @DESCRIPCION, CONVERT(DECIMAL(28,8),@PESO), 'S' , @ESTADO, @ID,

														 @ID_MARCA, @CATEGORIAS, NULL, NULL,
												 
														 NULL, @INDICADOR, @DESTACADO, CONVERT(DECIMAL(28,8),@COSTO_SHIPPING),
												 
														 @RESERVA, CONVERT(DECIMAL(28,8),@POR_RESERVA), CONVERT(INT, @CARRITO),
												 
														 @USAR_GIF, CONVERT(INT,@TIEMPO_GIF), @VIDEO,  1, @LANG_NOMBRE,
												 
														 @LANG_DESCRIP, @NOMBRE, @DESCRIPCION, CONVERT(DECIMAL(28,8),@IMPUESTO) , @TAGS, @SEO_TAGS )


					--insertamos en articulo cantidad
					INSERT INTO APLIX_ECOMERCE.CEMACO.ARTICULOS_CANTIDAD(ARTICULO, CANTIDAD) VALUES(@SKU, CONVERT(DECIMAL(28,8),@STOCK))

					--insertamos en articulos precio
					INSERT INTO APLIX_ECOMERCE.CEMACO.ARTICULOS_PRECIO(ARTICULO, PRECIO, DESCUENTO) VALUES(@SKU, CONVERT(DECIMAL(28,8),@PRECIO), CONVERT(DECIMAL(28,8),@OFERTA))
				END
			ELSE
				BEGIN
					--actualizamos el articulo porque ya exite en la tabla
					UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS
						SET
							NOMBRE = @NOMBRE, 
							DESCRIPCION = @DESCRIPCION, 
							PESO = CONVERT(DECIMAL(28,8),@PESO), 
							ACTIVO = 'S', 
							ESTADO = @ESTADO, 
							ID = @ID,
							ID_MARCA = @ID_MARCA, 
							ID_CATEGORIAS = @CATEGORIAS, 
							IMPUESTO = CONVERT(DECIMAL(28,8),@IMPUESTO),
							ID_VALORES_ATRIBUTOS = NULL, 
							ID_PADRE = NULL,
							ID_HIJO = NULL, 
							INDICADOR_STOCK = @INDICADOR, 
							DESTACADO = @DESTACADO, 
							COSTO_SHIPPING = CONVERT(DECIMAL(28,8),@COSTO_SHIPPING),
							PERMITE_RESERVA = @RESERVA,
							PORCENTAJE_RESERVA = CONVERT(DECIMAL(28,8),@POR_RESERVA), 
							LIMITE_CARRITO = CONVERT(INT, @CARRITO),
							USAR_GIF = @USAR_GIF, 
							GIF_TIEMPO = CONVERT(INT,@TIEMPO_GIF),
							VIDEO_YOUTUBE = @VIDEO, 
							ID_TRADUC = 1, 
							NOMBRE_TRADUC = @LANG_NOMBRE,
							DESCRIPCION_TRADUC = @LANG_DESCRIP,
							NOMBRE_NIDUX = @NOMBRE, 
							DESCRIPCION_NIDUX = @DESCRIPCION,
							TAGS = @TAGS,
							SEO_TAGS = @SEO_TAGS
						WHERE ARTICULO = @SKU

					UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS_CANTIDAD
						SET
							CANTIDAD = CONVERT(DECIMAL(28,8),@STOCK)
						WHERE ARTICULO = @SKU

					UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS_PRECIO
						SET
							PRECIO = CONVERT(DECIMAL(28,8),@PRECIO),
							DESCUENTO = CONVERT(DECIMAL(28,8),@OFERTA)
						WHERE ARTICULO = @SKU

				END

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[INSERTAR_ARTICULOS_VARIACIONES_TIENDA_APP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[INSERTAR_ARTICULOS_VARIACIONES_TIENDA_APP](@SKU_PADRE VARCHAR(255), @ID VARCHAR(255), @NOMBRE VARCHAR(255), 
										 @ATRIBUTOS VARCHAR(255), @SKU VARCHAR(255), @PRECIO VARCHAR(255), @STOCK VARCHAR(255), 
										 @PESO VARCHAR(255), @IMPUESTO VARCHAR(255))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			--hacemos el cambio de las variaciones por el codigo
			DECLARE @CONTADOR AS INT = 0
			DECLARE @CANT INT
			DECLARE @VARIACION_FINAL VARCHAR(255)

			SELECT @CANT = COUNT(ID) FROM APLIX_ECOMERCE.CEMACO.VALORES_ATRIBUTOS WHERE DESCRIPCION IN ( select * from CEMACO.BUSCAR_VARIACIONES_ARTICULOS(@ATRIBUTOS))
			SELECT ID INTO #TEMP FROM APLIX_ECOMERCE.CEMACO.VALORES_ATRIBUTOS WHERE DESCRIPCION IN ( select * from CEMACO.BUSCAR_VARIACIONES_ARTICULOS(@ATRIBUTOS))

			WHILE(@CONTADOR < @CANT)
				BEGIN
					DECLARE @CODIGO AS INT = (SELECT TOP(1) ID FROM #TEMP)
					SET @VARIACION_FINAL = CONCAT(@CODIGO, ',', @VARIACION_FINAL);
					DELETE #TEMP WHERE ID = @CODIGO
					SET @CONTADOR = @CONTADOR + 1;
				END
			SET @VARIACION_FINAL = REPLACE(@VARIACION_FINAL + '<END>', ',<END>', '')
			--print @VARIACION_FINAL

			--revisamos si la variacion es igual que el padre
			IF((SELECT ARTICULO FROM APLIX_ECOMERCE.CEMACO.ARTICULOS WHERE ARTICULO = @SKU) IS NULL)--------AQUI HABIA UNA S DE ACTIVO TENFO QUE QUITARLO EN EL OTRO DOCUMENTO VIEJO DE SP
				BEGIN

					--insertamos en la tabla articulos
							INSERT INTO APLIX_ECOMERCE.CEMACO.ARTICULOS(ARTICULO, NOMBRE, NOMBRE_NIDUX, PESO, ACTIVO,
												 
																 ID_VALORES_ATRIBUTOS, ID_PADRE, ID_HIJO, IMPUESTO) 
			
														  VALUES(@SKU, @NOMBRE, @NOMBRE, CONVERT(DECIMAL(28,8),@PESO), 'S',
												  
																 @VARIACION_FINAL,@SKU_PADRE, @ID, @IMPUESTO)


							--insertamos en articulo cantidad
							INSERT INTO APLIX_ECOMERCE.CEMACO.ARTICULOS_CANTIDAD(ARTICULO, CANTIDAD) VALUES(@SKU, CONVERT(DECIMAL(28,8),@STOCK))

							--seleccionamos el descuento del padre, ya que es un hijo y este tiene que heredar el descuento
							DECLARE @DESCUENTO DECIMAL(28,8)
							SELECT @DESCUENTO = DESCUENTO FROM APLIX_ECOMERCE.CEMACO.ARTICULOS_PRECIO WHERE ARTICULO = @SKU_PADRE

							IF @DESCUENTO IS NOT NULL
								BEGIN
									--insertamos en articulos precio
									INSERT INTO APLIX_ECOMERCE.CEMACO.ARTICULOS_PRECIO(ARTICULO, PRECIO, DESCUENTO) VALUES(@SKU, CONVERT(DECIMAL(28,8),@PRECIO), @DESCUENTO)
								END
							ELSE
								BEGIN
									--insertamos en articulos precio
									INSERT INTO APLIX_ECOMERCE.CEMACO.ARTICULOS_PRECIO(ARTICULO, PRECIO, DESCUENTO) VALUES(@SKU, CONVERT(DECIMAL(28,8),@PRECIO), 0)
								END
				END
			ELSE
				BEGIN
					--actualizamos el articulo porque ya exite en la tabla como padre
					UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS
						SET
							ID_VALORES_ATRIBUTOS = @VARIACION_FINAL,
							ID_PADRE = @SKU_PADRE,
							ID_HIJO = @ID,
							ACTIVO = 'S',
							PESO = CONVERT(DECIMAL(28,8),@PESO)
						WHERE ARTICULO = @SKU

					UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS_CANTIDAD
						SET
							CANTIDAD = CONVERT(DECIMAL(28,8),@STOCK)
						WHERE ARTICULO = @SKU

					UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS_PRECIO
						SET
							PRECIO = CONVERT(DECIMAL(28,8),@PRECIO)
						WHERE ARTICULO = @SKU

				END
			

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[INSERTAR_ATRIBUTOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[INSERTAR_ATRIBUTOS](@ID AS INT, @DESCRIPCION AS VARCHAR(150))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			IF((SELECT ID FROM APLIX_ECOMERCE.CEMACO.ATRIBUTOS WHERE DESCRIPCION LIKE CONCAT(@DESCRIPCION,'%')) IS NULL)
				BEGIN
					--NO EXISTE EL ATRIBUTO, INSERTAMOS
					INSERT INTO APLIX_ECOMERCE.CEMACO.ATRIBUTOS (ID, DESCRIPCION) VALUES (@ID, @DESCRIPCION)
				END
			ELSE
				BEGIN
					--SI EXISTE EL ATRIBUTO, ACTUALIZAMOS
					UPDATE APLIX_ECOMERCE.CEMACO.ATRIBUTOS
						SET
							ID = @ID
						WHERE DESCRIPCION = @DESCRIPCION
				END
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[INSERTAR_CATEGORIAS_APP_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[INSERTAR_CATEGORIAS_APP_SIMPLE](@NOMBRE VARCHAR(MAX), @DESCRIPCION VARCHAR(MAX), @CODIGO INT, @CODIGO_PADRE INT)
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			INSERT INTO APLIX_ECOMERCE.CEMACO.CATEGORIAS (NOMBRE, DESCRIPCION, CODIGO_NIDUX, SUBCATEGORIA_NIDUX)

								   VALUES(@NOMBRE,@DESCRIPCION, @CODIGO, @CODIGO_PADRE)
			
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[INSERTAR_CATEGORIAS_CODISA]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[INSERTAR_CATEGORIAS_CODISA]
AS
	BEGIN
			SELECT CASE
				WHEN CC.SUBCATEGORIA_NIDUX != 0 THEN SUBCATEGORIA_NIDUX
				ELSE CC.CODIGO_NIDUX END AS CODIGO_NIDUX,
				CASE 
				WHEN CC.SUBCATEGORIA_NIDUX = 0 THEN CC.NOMBRE
				ELSE (SELECT NOMBRE FROM APLIX_ECOMERCE.CEMACO.CATEGORIAS WHERE CODIGO_NIDUX = CC.SUBCATEGORIA_NIDUX)  END NOMBRE_CAT, 
				CASE
				WHEN CC.SUBCATEGORIA_NIDUX = 0 THEN 0
				ELSE CC.CODIGO_NIDUX END AS SUBCATEGORIA_NIDUX,
				CASE
				WHEN CC.SUBCATEGORIA_NIDUX = 0 THEN ''
				ELSE CC.NOMBRE END AS SUBNOMBRE_CAT
				FROM APLIX_ECOMERCE.CEMACO.CATEGORIAS CC
				WHERE RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.CEMACO.CREDENCIALES WHERE ID = 1)


			--SELECT CASE 
			--	WHEN CC.SUBCATEGORIA_NIDUX = 0 THEN CC.NOMBRE
			--	ELSE (SELECT NOMBRE FROM APLIX_ECOMERCE.CEMACO.CATEGORIAS WHERE CODIGO_NIDUX = CC.SUBCATEGORIA_NIDUX)  END NOMBRE_CAT, 
			--  CC.CODIGO_NIDUX, CC.SUBCATEGORIA_NIDUX,
			--   CASE
			--	WHEN CC.SUBCATEGORIA_NIDUX = 0 THEN ''
			--	ELSE CC.NOMBRE END AS SUBNOMBRE_CAT FROM APLIX_ECOMERCE.CEMACO.CATEGORIAS CC
			--WHERE RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.CEMACO.CREDENCIALES WHERE ID = 1) --ACTIVO = 'S' AND
	END
GO
/****** Object:  StoredProcedure [CEMACO].[INSERTAR_CATEGORIAS_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[INSERTAR_CATEGORIAS_SIMPLE](@NOMBRE VARCHAR(MAX), @DESCRIPCION VARCHAR(MAX), @CODIGO INT, @SUBCATEGORIA INT) 
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		--INSERTA SI NO EXISTE LA CATEGORIA, SINO LA ACTUALIZA
			IF((SELECT CODIGO_NIDUX FROM CEMACO.CATEGORIAS WHERE CODIGO_NIDUX = @CODIGO) IS NULL)
				BEGIN
					INSERT INTO CEMACO.CATEGORIAS (NOMBRE, DESCRIPCION, CODIGO_NIDUX, SUBCATEGORIA_NIDUX)

								   VALUES(@NOMBRE,@DESCRIPCION, @CODIGO, @SUBCATEGORIA)
				END
			ELSE
				BEGIN
					UPDATE CEMACO.CATEGORIAS
					SET
						NOMBRE = @NOMBRE,
						DESCRIPCION = @DESCRIPCION
					WHERE CODIGO_NIDUX = @CODIGO
				END
			
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[INSERTAR_ID_WiSH]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[INSERTAR_ID_WiSH](
	@WISH_ID INT,
	@ORDERID INT
)
AS
	IF EXISTS(SELECT ORDERID FROM CEMACO.PEDIDOS WHERE ORDERID = @ORDERID)
	BEGIN
		UPDATE CEMACO.PEDIDOS
		   SET WISH_ID = @WISH_ID
		 WHERE ORDERID = @ORDERID
	END
GO
/****** Object:  StoredProcedure [CEMACO].[INSERTAR_MARCAS_APP_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[INSERTAR_MARCAS_APP_SIMPLE](@NOMBRE VARCHAR(255), @ID INT)
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			INSERT INTO APLIX_ECOMERCE.CEMACO.MARCAS(DESCRIPCION_NIDUX, CODIGO_NIDUX) VALUES (@NOMBRE, @ID)

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[INSERTAR_MARCAS_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[INSERTAR_MARCAS_SIMPLE](@NOMBRE VARCHAR(MAX), @CODIGO INT) 
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		--INSERTA SI NO EXISTE LA MARCA, SINO LA ACTUALIZA
			IF((SELECT CODIGO_NIDUX FROM CEMACO.MARCAS WHERE CODIGO_NIDUX = @CODIGO) IS NULL)
				BEGIN
					INSERT INTO CEMACO.MARCAS (DESCRIPCION_NIDUX, CODIGO_NIDUX)

								   VALUES(@NOMBRE, @CODIGO)
				END
			ELSE
				BEGIN
					UPDATE CEMACO.MARCAS
					SET
						DESCRIPCION_NIDUX = @NOMBRE
					WHERE CODIGO_NIDUX = @CODIGO
				END
			
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[INSERTAR_VALORES_ATRIBUTOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[INSERTAR_VALORES_ATRIBUTOS](@ID_VALOR AS INT, @DESCRIPCION AS VARCHAR(150), @ID_ATRIBUTO AS INT)
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			INSERT INTO APLIX_ECOMERCE.CEMACO.VALORES_ATRIBUTOS (ID, DESCRIPCION, ID_ATRIBUTO) VALUES (@ID_VALOR, @DESCRIPCION, @ID_ATRIBUTO)
			
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [CEMACO].[INSERTAR_VARIACIONES_EXCEL]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--INsertamos las variaciones por medio de un Excel
CREATE   PROC [CEMACO].[INSERTAR_VARIACIONES_EXCEL](
@SKU_PADRE AS VARCHAR(MAX),
@SKU_VAR AS VARCHAR(MAX),
@ATRIBUTOS AS VARCHAR(MAX),
@SINCRONIZA AS VARCHAR(2)
)
AS
BEGIN

UPDATE APLIX_ECOMERCE.CEMACO.ARTICULOS
SET ID_VALORES_ATRIBUTOS = @ATRIBUTOS,
ID_PADRE = @SKU_PADRE,
ACTIVO = @SINCRONIZA
WHERE ARTICULO = @SKU_VAR


END
GO
/****** Object:  StoredProcedure [CEMACO].[MODIFICAR_CATEGORIAS_NIDUX_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[MODIFICAR_CATEGORIAS_NIDUX_SIMPLE]
AS
	BEGIN
		SELECT NOMBRE, DESCRIPCION, CODIGO_NIDUX, SUBCATEGORIA_NIDUX FROM CEMACO.CATEGORIAS WHERE RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.CEMACO.CREDENCIALES WHERE ID = 1)
	END
GO
/****** Object:  StoredProcedure [CEMACO].[MOSTRAR_ARTICULOS_PADRE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [CEMACO].[MOSTRAR_ARTICULOS_PADRE]
AS
	BEGIN
		SELECT a.ID_PADRE as ARTICULO , ar.ID FROM (SELECT ID_PADRE FROM APLIX_ECOMERCE.CEMACO.ARTICULOS 
								WHERE RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.CEMACO.CREDENCIALES WHERE ID = 1) AND ACTIVO = 'S' AND ID_PADRE IS NOT NULL GROUP BY ID_PADRE) as a
								INNER JOIN APLIX_ECOMERCE.CEMACO.ARTICULOS as ar ON a.ID_PADRE = ar.ARTICULO
	END
GO
/****** Object:  StoredProcedure [CEMACO].[OBTENER_FILTRO_ARTICULOS_TP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [CEMACO].[OBTENER_FILTRO_ARTICULOS_TP]
--TP = TABLAS PROPIAS
AS
BEGIN
	SELECT TOP (1) * FROM APLIX_ECOMERCE.CEMACO.FILTRO_ARTICULO_TABLAS_PROPIAS
END
GO
/****** Object:  StoredProcedure [CEMACO].[OBTENER_FILTRO_PEDIDOS_TP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [CEMACO].[OBTENER_FILTRO_PEDIDOS_TP]
--TP = TABLAS PROPIAS
AS
BEGIN
	SELECT TOP (1) * FROM APLIX_ECOMERCE.CEMACO.FILTRO_PEDIDOS_TABLAS_PROPIAS
END
GO
/****** Object:  StoredProcedure [CEMACO].[TRAER_ATRIBUTOS_EXCEL]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROC [CEMACO].[TRAER_ATRIBUTOS_EXCEL]
AS
BEGIN
select 

ID, DESCRIPCION , (SELECT DESCRIPCION  FROM APLIX_ECOMERCE.CEMACO.ATRIBUTOS WHERE ID = VA.ID_ATRIBUTO) AS ATRIBUTO

from APLIX_ECOMERCE.CEMACO.VALORES_ATRIBUTOS VA

ORDER BY VA.ID_ATRIBUTO

END 
GO
/****** Object:  StoredProcedure [CEMACO].[TRAER_CATEGORIAS_EXCEL]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--Traemos las categorias al excelde nidux
CREATE   PROC [CEMACO].[TRAER_CATEGORIAS_EXCEL]
AS
BEGIN

SELECT CA.CODIGO_NIDUX,CA.NOMBRE,
(SELECT NOMBRE AS PADRE FROM CEMACO.CATEGORIAS WHERE CODIGO_NIDUX = CA.SUBCATEGORIA_NIDUX ) AS PADRE
FROM
CEMACO.CATEGORIAS CA 
INNER JOIN 
CEMACO.CATEGORIAS CT
ON CA.CODIGO_NIDUX = CT.CODIGO_NIDUX 

END
GO
/****** Object:  StoredProcedure [CEMACO].[TRAER_ESTADOS_ARTICULOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--traemos los estados de los articulos
CREATE   PROC [CEMACO].[TRAER_ESTADOS_ARTICULOS]
AS
BEGIN
SELECT ID, DESCRIPCION  FROM APLIX_ECOMERCE.CEMACO.ARTICULO_ESTADO
END
GO
/****** Object:  StoredProcedure [CEMACO].[TRAER_MARCAS_EXCEL]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Traemos las marcas al excelde nidux
CREATE   PROC [CEMACO].[TRAER_MARCAS_EXCEL]
AS
BEGIN
SELECT CODIGO_NIDUX AS CODIGO, DESCRIPCION_NIDUX FROM APLIX_ECOMERCE.CEMACO.MARCAS
END
GO
/****** Object:  StoredProcedure [CEMACO].[VALIDAR_ATRIBUTOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--validamos que los atributos que vienen del excel existan campo de atributos en variaciones
CREATE   PROC [CEMACO].[VALIDAR_ATRIBUTOS](
@ID AS INT 
)
AS
BEGIN

DECLARE @MEN AS VARCHAR(2)

IF ((SELECT ID FROM APLIX_ECOMERCE.CEMACO.VALORES_ATRIBUTOS WHERE ID = @ID) IS NOT NULL)
BEGIN
SET @MEN = 'S'
END
ELSE
BEGIN
SET @MEN = 'N'
END

SELECT @MEN AS MENSAJE

END
GO
/****** Object:  StoredProcedure [CEMACO].[VALIDAR_CATEGORIAS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--validamos que las categorias que vienen del excel campo de categorias
CREATE   PROC [CEMACO].[VALIDAR_CATEGORIAS](
@ID AS INT 
)
AS
BEGIN

DECLARE @MEN AS VARCHAR(2)

IF ((SELECT CODIGO_NIDUX FROM APLIX_ECOMERCE.CEMACO.CATEGORIAS WHERE CODIGO_NIDUX = @ID) IS NOT NULL)
BEGIN
SET @MEN = 'S'
END
ELSE
BEGIN
SET @MEN = 'N'
END

SELECT @MEN AS MENSAJE

END
GO
/****** Object:  StoredProcedure [CEMACO].[VALIDAR_MARCAS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--validamos que las categorias que vienen del excel campo de categorias
CREATE   PROC [CEMACO].[VALIDAR_MARCAS](
@ID AS INT 
)
AS
BEGIN

DECLARE @MEN AS VARCHAR(2)

IF ((SELECT CODIGO_NIDUX FROM APLIX_ECOMERCE.CEMACO.MARCAS WHERE CODIGO_NIDUX = @ID) IS NOT NULL)
BEGIN
SET @MEN = 'S'
END
ELSE
BEGIN
SET @MEN = 'N'
END

SELECT @MEN AS MENSAJE

END
GO
/****** Object:  StoredProcedure [NIDUX].[ACT_ACTIVAR_ARTICULOS_APP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[ACT_ACTIVAR_ARTICULOS_APP](@ARTICULO VARCHAR(255), @ACTIVO VARCHAR(2))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS
				SET
					ACTIVO = @ACTIVO
				WHERE ARTICULO = @ARTICULO

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[ACT_ARTICULOS_APP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [NIDUX].[ACT_ARTICULOS_APP](@ARTICULO VARCHAR(255),
										 @NOMBRE_NIDUX VARCHAR (MAX),
										 @DESCRIPCION_NIDUX VARCHAR (MAX),
										 @SHIPPING DECIMAL(28,8),
										 @PORCENTAJE DECIMAL(28,8),
										 @CARRITO VARCHAR (MAX),
										 @TIEMPO_GIF VARCHAR (MAX),
										 @VIDEO VARCHAR (MAX),
										 @NOMBRE_TRA VARCHAR (MAX),
										 @DESCRIP_TRADUC VARCHAR (MAX),
										 @DESCUENTO DECIMAL(28,8),
										 @ESTADO VARCHAR(255), 
										 @ACTIVO VARCHAR(2),
										 @INDICADOR VARCHAR(2), 
										 @DESTACADO VARCHAR(2), 
										 @RESERVA VARCHAR(2), 
										 @GIF VARCHAR(2), 
										 @TAGS VARCHAR(4000),
										 @SEO_TAGS VARCHAR(4000))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ESTADO_ARTICULO INT
			SELECT @ESTADO_ARTICULO = ID FROM APLIX_ECOMERCE.NIDUX.ARTICULO_ESTADO WHERE DESCRIPCION = @ESTADO

			UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS
				SET
					ESTADO = CONVERT(INT,@ESTADO_ARTICULO),
					ACTIVO = @ACTIVO,
					INDICADOR_STOCK = @INDICADOR,
					DESTACADO = @DESTACADO,
					PERMITE_RESERVA = @RESERVA,
					USAR_GIF = @GIF,
					NOMBRE_NIDUX = @NOMBRE_NIDUX,
					DESCRIPCION_NIDUX = @DESCRIPCION_NIDUX,
					COSTO_SHIPPING =  @SHIPPING,
					PORCENTAJE_RESERVA = @PORCENTAJE,
					LIMITE_CARRITO = CONVERT(INT, @CARRITO),
					GIF_TIEMPO = CONVERT(INT, @TIEMPO_GIF),
					VIDEO_YOUTUBE = @VIDEO,
					NOMBRE_TRADUC = @NOMBRE_TRA,
					DESCRIPCION_TRADUC = @DESCRIP_TRADUC,
					TAGS = @TAGS,
					SEO_TAGS = @SEO_TAGS
				WHERE ARTICULO = @ARTICULO

			UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS_PRECIO
				SET
					DESCUENTO =  @DESCUENTO
				WHERE ARTICULO = @ARTICULO
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[ACT_ARTICULOS_EDITADOS_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [NIDUX].[ACT_ARTICULOS_EDITADOS_SIMPLE]
AS
	BEGIN
		SELECT AR.ID, AR.ARTICULO AS SKU,
			CASE 
				WHEN AR.NOMBRE_NIDUX IS NULL
				THEN AR.NOMBRE
				WHEN AR.NOMBRE_NIDUX = ''
				THEN AR.NOMBRE
				ELSE AR.NOMBRE_NIDUX END AS NOMBRE, 
			CASE 
				WHEN AR.DESCRIPCION_NIDUX IS NULL
				THEN AR.DESCRIPCION
				WHEN AR.DESCRIPCION_NIDUX = ''
				THEN AR.DESCRIPCION
				ELSE AR.DESCRIPCION_NIDUX END AS DESCRIPCION, AR.ACTIVO ,
			CASE
				WHEN MA.CODIGO_NIDUX IS NULL
				THEN CONVERT(VARCHAR,0)
				ELSE MA.CODIGO_NIDUX END AS ID_MARCA,
			CASE 
				WHEN AR.ID_CATEGORIAS IS NULL 
				THEN CONVERT(VARCHAR,0) 
				ELSE AR.ID_CATEGORIAS END AS ID_CATEGORIAS,
			  AP.PRECIO, AR.COSTO_SHIPPING, AR.PESO, AP.DESCUENTO,
			  CASE
			WHEN AR.ESTADO IS NULL THEN 3
			WHEN AR.ESTADO = '' THEN 3
			ELSE AR.ESTADO END AS ESTADO,
			AR.DESTACADO, AC.CANTIDAD, AR.VIDEO_YOUTUBE, AR.INDICADOR_STOCK, AR.PERMITE_RESERVA, AR.LIMITE_CARRITO, AR.PORCENTAJE_RESERVA,
			CASE 
				WHEN AR.USAR_GIF IS NULL THEN CONVERT(VARCHAR,0) 
				ELSE AR.USAR_GIF END USAR_GIF,
			CASE	
				WHEN AR.GIF_TIEMPO IS NULL THEN 0
				ELSE AR.GIF_TIEMPO END GIF_TIEMPO, 
			AR.ID_TRADUC AS ID_TRADUC, AR.NOMBRE_TRADUC AS NOMBRE_TRADUC, AR.DESCRIPCION_TRADUC as DESCRIPCION_TRADUC, AR.IMPUESTO, AR.TAGS, AR.SEO_TAGS
		FROM APLIX_ECOMERCE.NIDUX.ARTICULOS AR 
		FULL OUTER JOIN APLIX_ECOMERCE.NIDUX.MARCAS AS MA ON AR.ID_MARCA = MA.CODIGO_NIDUX
		INNER JOIN APLIX_ECOMERCE.NIDUX.ARTICULOS_PRECIO AS AP ON AR.ARTICULO = AP.ARTICULO
		INNER JOIN APLIX_ECOMERCE.NIDUX.ARTICULOS_CANTIDAD AS AC ON AR.ARTICULO = AC.ARTICULO
		WHERE AR.ACTIVO = 'S' AND AR.RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.NIDUX.CREDENCIALES WHERE ID = 1) 
		AND (AR.ID_PADRE IS NULL OR AR.ID_PADRE = '' OR AR.ARTICULO = AR.ID_PADRE) 
	END
GO
/****** Object:  StoredProcedure [NIDUX].[ACT_ATRIBUTOS_ARTICULOS_APP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[ACT_ATRIBUTOS_ARTICULOS_APP](@ATRIBUTOS VARCHAR(255), @ARTICULO VARCHAR(255))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS
				SET
					ID_VALORES_ATRIBUTOS = @ATRIBUTOS
				WHERE ARTICULO = @ARTICULO

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[ACT_CANTIDAD_ARTICULOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Actualizar cantidad de articulos
CREATE PROC [NIDUX].[ACT_CANTIDAD_ARTICULOS]
AS
	BEGIN
		SELECT AC.ARTICULO, AC.CANTIDAD FROM APLIX_ECOMERCE.NIDUX.ARTICULOS_CANTIDAD AS AC
			INNER JOIN APLIX_ECOMERCE.NIDUX.ARTICULOS AS AR ON AR.ARTICULO = AC.ARTICULO
			WHERE AC.RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.NIDUX.CREDENCIALES WHERE ID = 1) AND AR.ACTIVO = 'S'
	END
GO
/****** Object:  StoredProcedure [NIDUX].[ACT_CATEGORIAS_ARTICULO_APP_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[ACT_CATEGORIAS_ARTICULO_APP_SIMPLE](@CATEGORIAS VARCHAR(255), @ARTICULO VARCHAR(255))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS
				SET
					ID_CATEGORIAS = @CATEGORIAS
				WHERE ARTICULO = @ARTICULO

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[ACT_ESTADO_ORDEN_PEDIDO]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--cambiar el estado de pedido, cuando llega en el ERP del Cliente
CREATE PROC [NIDUX].[ACT_ESTADO_ORDEN_PEDIDO]
AS
	BEGIN
		SELECT ORDERID FROM APLIX_ECOMERCE.NIDUX.PEDIDOS
			WHERE ESTADO_ORDEN = 'En proceso' AND RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.NIDUX.CREDENCIALES WHERE ID = 1)
	END
GO
/****** Object:  StoredProcedure [NIDUX].[ACT_FECHA_CONSULTA]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[ACT_FECHA_CONSULTA](
   @FECHA DATETIME
)
AS
	BEGIN
		UPDATE NIDUX.CREDENCIALES
			SET
				FECHA_CONSULTA = CONVERT(DATETIME,@FECHA)
			WHERE ID = 1
	END
GO
/****** Object:  StoredProcedure [NIDUX].[ACT_ID_ARTICULOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Actualizar id del articulo
CREATE PROC [NIDUX].[ACT_ID_ARTICULOS](@SKU AS VARCHAR(50), @ID AS INT)
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		--actualizamos el id
		UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS
			SET
				ID = @ID
			WHERE ARTICULO = @SKU

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[ACT_MARCA_ARTICULO_APP_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[ACT_MARCA_ARTICULO_APP_SIMPLE](@CODIGO_NIDUX INT, @ARTICULO VARCHAR(255))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS
				SET
					ID_MARCA = @CODIGO_NIDUX
				WHERE ARTICULO = @ARTICULO

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[ACT_PADRE_DATOS_APP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[ACT_PADRE_DATOS_APP](@CODIGO VARCHAR(255), @ARTICULO VARCHAR(255))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS
				SET
					ID_PADRE = @CODIGO
				WHERE ARTICULO = @ARTICULO

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[ACT_PRECIO_ARTICULOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Actualizar precio de articulos
CREATE PROC [NIDUX].[ACT_PRECIO_ARTICULOS]
AS
	BEGIN
		SELECT AP.ARTICULO, AP.PRECIO FROM APLIX_ECOMERCE.NIDUX.ARTICULOS_PRECIO AS AP
		INNER JOIN APLIX_ECOMERCE.NIDUX.ARTICULOS AS AR ON AP.ARTICULO = AR.ARTICULO
			WHERE AP.RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.NIDUX.CREDENCIALES WHERE ID = 1) AND AR.ACTIVO = 'S'
	END
GO
/****** Object:  StoredProcedure [NIDUX].[ACTUALIZAR_ARTICULOS_ELIMANADOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [NIDUX].[ACTUALIZAR_ARTICULOS_ELIMANADOS](@ARTICULO AS VARCHAR(255))
AS
	BEGIN
		UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS 
			SET ID = NULL
		WHERE ARTICULO = @ARTICULO
	END
GO
/****** Object:  StoredProcedure [NIDUX].[ACTUALIZAR_CATEGORIAS_APP_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[ACTUALIZAR_CATEGORIAS_APP_SIMPLE](@NOMBRE VARCHAR(MAX), @DESCRIPCION VARCHAR(MAX), @CODIGO INT)
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE APLIX_ECOMERCE.NIDUX.CATEGORIAS
				SET
					NOMBRE = @NOMBRE,
					DESCRIPCION = @DESCRIPCION
				WHERE CODIGO_NIDUX = @CODIGO
			
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END	
GO
/****** Object:  StoredProcedure [NIDUX].[ACTUALIZAR_FILTRO_ARTICULOS_TP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [NIDUX].[ACTUALIZAR_FILTRO_ARTICULOS_TP]
@codigo_articulo int,
@nombre int,
@nombre_nidux int,
@descripcion int,
@descripcion_nidux int,
@peso int,
@cantidad int,
@precio int,
@porcentaje_descuento int,
@impuesto_articulo int,
@sincroniza int,
@estado int,
@id_nidux int,
@marca_nidux int,
@categorias int,
@valores_atributos int,
@id_padre int,
@id_hijo int,
@indicador_stock int,
@destacar_articulo int,
@costo_shipping int,
@permite_reserva int,
@porcentaje_reserva int,
@limite_carrito int,
@usa_gif int,
@tiempo_gif int,
@video_youtube int,
@nombre_ingles int,
@descripcion_ingles int 
AS
BEGIN
	UPDATE APLIX_ECOMERCE.NIDUX.FILTRO_ARTICULO_TABLAS_PROPIAS
	SET codigo_articulo			= @codigo_articulo,
		nombre					= @nombre,
		nombre_nidux			= @nombre_nidux,
		descripcion				= @descripcion,
		descripcion_nidux		= @descripcion_nidux,
		peso					= @peso,
		cantidad				= @cantidad,
		precio					= @precio,
		porcentaje_descuento	= @porcentaje_descuento,
		impuesto_articulo		= @impuesto_articulo,
		sincroniza				= @sincroniza,
		estado					= @estado,
		id_nidux				= @id_nidux,
		marca_nidux				= @marca_nidux,
		categorias				= @categorias,
		valores_atributos		= @valores_atributos,
		id_padre				= @id_padre,
		id_hijo					= @id_hijo,
		indicador_stock			= @indicador_stock,
		destacar_articulo		= @destacar_articulo,
		costo_shipping			= @costo_shipping,
		permite_reserva			= @permite_reserva,
		porcentaje_reserva		= @porcentaje_reserva,
		limite_carrito			= @limite_carrito,
		usa_gif					= @usa_gif,
		tiempo_gif				= @tiempo_gif,
		video_youtube			= @video_youtube,
		nombre_ingles			= @nombre_ingles,
		descripcion_ingles		= @descripcion_ingles
END 
GO
/****** Object:  StoredProcedure [NIDUX].[ACTUALIZAR_FILTRO_PEDIDOS_TP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [NIDUX].[ACTUALIZAR_FILTRO_PEDIDOS_TP]
@numero_orden int,
@nombre_cliente int,
@identificacion int,
@correo_cliente int,
@tel_fijo int,
@tel_movil int,
@comprador_anonimo int,
@monto_impuesto int,
@fecha int,
@order_gif int,
@estado_orden int,
@moneda int,
@observaciones int,
@cod_autorizacion int,
@ip_origen int,
@estado_pago int,
@medio_pago int,
@total_orden int, 
@uso_cupon int,
@tipo_cupon int,
@sucursal int, 
@recoger_sucursal int,
@metodo_pago int,
@moneda_facturacion int,
@tipo_envio int,
@costo_envio int,
@costo_impuesto_envio int,
@nombre_destinatario int,
@identificacion_envio int,
@tipo_identi_envio int,
@correo_envio int,
@telefono_envio int,
@tel_movil_envio int,
@pais_envio int, 
@provincia_envio int,
@canton_envio int,
@distrito_envio int, 
@detalle_direccion_envio int,
@ciudad_envio int,
@codigo_zip_envio int,
@posicion_latitud int,
@posicion_longitud int,
@nombre_destinatario_fac int,
@identificacion_fac int,
@tipo_id_fac int,
@correo_fac int,
@telefono_fac int,
@tel_movil_fac int,
@pais_fac int,
@provincia_fac int,
@canton_fac int,
@distrito_fac int,
@detalle_dir_fac int,
@ciudad_fac int,
@codigo_zip_fac int,
@posicion_latitud_fac int,
@posicion_longitud_fac int 
AS
BEGIN

	UPDATE APLIX_ECOMERCE.NIDUX.FILTRO_PEDIDOS_TABLAS_PROPIAS
	SET 
	numero_orden				= @numero_orden,
	nombre_cliente				= @nombre_cliente,
	identificacion				= @identificacion,
	correo_cliente				= @correo_cliente,
	tel_fijo					= @tel_fijo,
	tel_movil					= @tel_movil,
	comprador_anonimo			= @comprador_anonimo,
	monto_impuesto				= @monto_impuesto,
	fecha						= @fecha,
	order_gif					= @order_gif,
	estado_orden				= @estado_orden,
	moneda						= @moneda,
	observaciones				= @observaciones,
	cod_autorizacion			= @cod_autorizacion,
	ip_origen					= @ip_origen,
	estado_pago					= @estado_pago,
	medio_pago					= @medio_pago,
	total_orden					= @total_orden, 
	uso_cupon					= @uso_cupon,
	tipo_cupon					= @tipo_cupon,
	sucursal					= @sucursal, 
	recoger_sucursal			= @recoger_sucursal,
	metodo_pago					= @metodo_pago,
	moneda_facturacion			= @moneda_facturacion,
	tipo_envio					= @tipo_envio,
	costo_envio					= @costo_envio,
	costo_impuesto_envio		= @costo_impuesto_envio,
	nombre_destinatario			= @nombre_destinatario,
	identificacion_envio		= @identificacion_envio,
	tipo_identi_envio			= @tipo_identi_envio,
	correo_envio				= @correo_envio,
	telefono_envio				= @telefono_envio,
	tel_movil_envio				= @tel_movil_envio,
	pais_envio					= @pais_envio, 
	provincia_envio				= @provincia_envio,
	canton_envio				= @canton_envio,
	distrito_envio				= @distrito_envio, 
	detalle_direccion_envio		= @detalle_direccion_envio,
	ciudad_envio				= @ciudad_envio,
	codigo_zip_envio			= @codigo_zip_envio,
	posicion_latitud			= @posicion_latitud,
	posicion_longitud			= @posicion_longitud,
	nombre_destinatario_fac		= @nombre_destinatario_fac,
	identificacion_fac			= @identificacion_fac,
	tipo_id_fac					= @tipo_id_fac,
	correo_fac					= @correo_fac,
	telefono_fac				= @telefono_fac,
	tel_movil_fac				= @tel_movil_fac,
	pais_fac					= @pais_fac,
	provincia_fac				= @provincia_fac,
	canton_fac					= @canton_fac,
	distrito_fac				= @distrito_fac,
	detalle_dir_fac				= @detalle_dir_fac,
	ciudad_fac					= @ciudad_fac,
	codigo_zip_fac				= @codigo_zip_fac,
	posicion_latitud_fac		= @posicion_latitud_fac,
	posicion_longitud_fac		= @posicion_longitud_fac 
END
GO
/****** Object:  StoredProcedure [NIDUX].[ACTUALIZAR_MARCAS_APP_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[ACTUALIZAR_MARCAS_APP_SIMPLE](@NOMBRE VARCHAR(255), @ID INT)
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE APLIX_ECOMERCE.NIDUX.MARCAS
				SET
					DESCRIPCION_NIDUX = @NOMBRE
				WHERE CODIGO_NIDUX = @ID
			
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END	
GO
/****** Object:  StoredProcedure [NIDUX].[ACTUALIZAR_MARCAS_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[ACTUALIZAR_MARCAS_SIMPLE]
AS
	BEGIN
		SELECT DESCRIPCION_NIDUX, CODIGO_NIDUX FROM NIDUX.MARCAS WHERE RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.NIDUX.CREDENCIALES WHERE ID = 1)
	END
GO
/****** Object:  StoredProcedure [NIDUX].[ACTUALIZO_TOKEN_ERP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ACTUALIZO EL TOKEN ERP
CREATE PROC [NIDUX].[ACTUALIZO_TOKEN_ERP](
	@TOKEN_NIDUX VARCHAR(MAX)
)
AS
BEGIN TRY
	UPDATE CEMACO.CREDENCIALES
	   SET TOKEN_NIDUX = @TOKEN_NIDUX,
		   FECHA_HORA_TOKEN = GETDATE()

	WHERE ID = 1
END TRY
	BEGIN CATCH
			INSERT INTO CEMACO.BITACORA_ERRORES_TABLAS_PROPIAS ( FECHA, PROCEDIMIENTO , ERROR) 
			VALUES (SYSDATETIME(), COALESCE(ERROR_PROCEDURE(), ''), 
			' Linea error: ' + CONVERT(VARCHAR(55),ERROR_LINE())+
			' Mensaje error: ' + ERROR_MESSAGE() +
			' Numero error: ' + CONVERT(VARCHAR(55),ERROR_NUMBER()) +  
			' Severity error: ' + CONVERT(VARCHAR(55),ERROR_SEVERITY()) +
			' Estado error: ' + CONVERT(VARCHAR(55),ERROR_STATE())
			)
	END CATCH

GO
/****** Object:  StoredProcedure [NIDUX].[ACTUALIZO_TOKEN_NIDUX]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ACTUALIZO EL TOKEN ERP
CREATE PROC [NIDUX].[ACTUALIZO_TOKEN_NIDUX](
	@TOKEN_NIDUX VARCHAR(MAX)
)
AS
BEGIN TRY
	UPDATE NIDUX.CREDENCIALES
	   SET TOKEN_NIDUX = @TOKEN_NIDUX,
		   FECHA_HORA_TOKEN = GETDATE()

	WHERE ID = 1
END TRY
	BEGIN CATCH
			INSERT INTO NIDUX.BITACORA_ERRORES_TABLAS_PROPIAS ( FECHA, PROCEDIMIENTO , ERROR) 
			VALUES (SYSDATETIME(), COALESCE(ERROR_PROCEDURE(), ''), 
			' Linea error: ' + CONVERT(VARCHAR(55),ERROR_LINE())+
			' Mensaje error: ' + ERROR_MESSAGE() +
			' Numero error: ' + CONVERT(VARCHAR(55),ERROR_NUMBER()) +  
			' Severity error: ' + CONVERT(VARCHAR(55),ERROR_SEVERITY()) +
			' Estado error: ' + CONVERT(VARCHAR(55),ERROR_STATE())
			)
	END CATCH

GO
/****** Object:  StoredProcedure [NIDUX].[ACTUALIZO_WISK_ID_SINCRONIZADO]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[ACTUALIZO_WISK_ID_SINCRONIZADO](
	@ORDERID VARCHAR(20),
	@ESTADO  VARCHAR(2)
)
AS 
BEGIN
	IF EXISTS(SELECT ORDERID FROM NIDUX.PEDIDOS WHERE ORDERID = @ORDERID)
	BEGIN
		UPDATE NIDUX.PEDIDOS
		   SET WISK_ID_SINCRONIZADO = @ESTADO
		 WHERE ORDERID = @ORDERID
	END
END

GO
/****** Object:  StoredProcedure [NIDUX].[AGREGAR_ATRIBUTOS_ARTICULOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Agregar atributos a los articulos
CREATE PROC [NIDUX].[AGREGAR_ATRIBUTOS_ARTICULOS](@ID_PADRE AS VARCHAR(255))
AS
	BEGIN
		DECLARE @LIST VARCHAR(200)
		SELECT @LIST = ID_VALORES_ATRIBUTOS FROM APLIX_ECOMERCE.NIDUX.ARTICULOS WHERE ID_PADRE = @ID_PADRE
		print @LIST
		SELECT VA.ID_ATRIBUTO, AA.DESCRIPCION FROM APLIX_ECOMERCE.NIDUX.VALORES_ATRIBUTOS AS VA 
			INNER JOIN APLIX_ECOMERCE.NIDUX.ATRIBUTOS AS AA on VA.ID_ATRIBUTO = AA.ID WHERE VA.ID IN (SELECT * FROM NIDUX.BUSCAR_VALORES_ATRIBUTOS(@LIST))
	END
GO
/****** Object:  StoredProcedure [NIDUX].[AGREGAR_PEDIDOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [NIDUX].[AGREGAR_PEDIDOS](
@orderId int, @wish_id int, @cliente varchar(255), @identificacion varchar(15), @correo varchar(255), @telefono_fijo varchar(20),
@telefono_movil varchar(20), @es_anonimo int, @monto_impuestos varchar(50), @fecha_orden varchar(25),
@orderGiftpointsUsed varchar(50), @estado_orden varchar(50), @moneda varchar(50), @observaciones varchar(500),
@codigo_autorizacion int, @ip_origen varchar(20), @estado_pago varchar(50), @medio_pago varchar(50),
@total varchar(50), @cuponUsado VARCHAR (50), @cuponTipo varchar(50), @sucursal varchar(50), @recoger_sucursal varchar(200), @codigo_metodo_pago varchar(200), @moneda_fe varchar(200),
@nombre_destinatario_envio varchar(255), @identificacion_envio varchar(15), @tipo_identificacion_envio varchar(150), @correo_envio varchar(255),
@telefono_envio varchar(20), @movil_envio varchar(20), @pais_envio varchar(50), @provincia_envio varchar(50), @canton_envio varchar(50), @distrito_envio varchar(50),
@detalle_direccion_envio varchar(500), @ciudad_envio varchar(100), @zip_envio varchar(10), @geo_latitud_envio varchar(255), @geo_longitud_envio varchar(255),
@nombre_destinatario_fac varchar(255), @identificacion_fac varchar(15), @tipo_identificacion_fac varchar(150), @correo_fac varchar(255),
@telefono_fac varchar(20), @movil_fac varchar(20), @pais_fac varchar(50), @provincia_fac varchar(50) ,@canton_fac varchar(50), @distrito_fac varchar(50),
@detalle_direccion_fac varchar(500), @ciudad_fac varchar(100), @zip_fac varchar(10), @geo_latitud_fac varchar(255), @geo_longitud_fac varchar(255),
@tipo_envio varchar(30), @costo_total_shipping varchar(100), @tasa_impuesto_shipping varchar(15)
)
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			IF NOT EXISTS(SELECT ORDERID FROM NIDUX.PEDIDOS WHERE ORDERID = @orderId)
			BEGIN 
			if(@wish_id is null)
			begin
			 set @wish_id = 0
			end 

			INSERT INTO APLIX_ECOMERCE.NIDUX.PEDIDOS ([ORDERID],[CLIENTE],[IDENTIFICACION],[CORREO],[TELEFONO_FIJO],[TELEFONO_MOVIL]

											   ,[ES_ANONIMO],[MONTO_IMPUESTOS],[FECHA_ORDEN],[ORDERGIFTPOINTSUSED],[ESTADO_ORDEN],[MONEDA]

											   ,[OBSERVACIONES],[CODIGO_AUTORIZACION],[IP_ORIGEN],[ESTADO_PAGO],[MEDIO_PAGO],[TOTAL]

											   ,[CUPONUSADO],[CUPONTIPO],[SUCURSAL],[RECOGER_SUCURSAL], [MONEDA_FE], [CODIGO_METODO_PAGO],[NOMBRE_DESTINATARIO_ENVIO],[IDENTIFICACION_ENVIO]

											   ,[TIPO_IDENTIFICACION_ENVIO],[CORREO_ENVIO],[TELEFONO_ENVIO],[MOVIL_ENVIO],[PAIS_ENVIO],[PROVINCIA_ENVIO]

											   ,[CANTON_ENVIO],[DISTRITO_ENVIO],[DETALLE_DIRECCION_ENVIO],[CIUDAD_ENVIO],[ZIP_ENVIO],[GEO_LATITUD_ENVIO]

											   ,[GEO_LONGITUD_ENVIO],[NOMBRE_DESTINATARIO_FAC],[IDENTIFICACION_FAC],[TIPO_IDENTIFICACION_FAC],[CORREO_FAC],[TELEFONO_FAC]

											   ,[MOVIL_FAC],[PAIS_FAC],[PROVINCIA_FAC],[CANTON_FAC],[DISTRITO_FAC],[DETALLE_DIRECCION_FAC]

											   ,[CIUDAD_FAC],[ZIP_FAC],[GEO_LATITUD_FAC],[GEO_LONGITUD_FAC]
											   
											   ,[TIPO_ENVIO], [COSTO_TOTAL_SHIPPING], [TASA_IMPUESTO_SHIPPING], [WISH_ID],WISK_ID_SINCRONIZADO) 
										
										VALUES (@orderId , @cliente , @identificacion , @correo , @telefono_fijo ,@telefono_movil , 

												@es_anonimo , @monto_impuestos , @fecha_orden ,@orderGiftpointsUsed , @estado_orden , @moneda , 

												@observaciones , @codigo_autorizacion , @ip_origen , @estado_pago , @medio_pago, @total , 
												
												@cuponUsado , @cuponTipo , @sucursal , @recoger_sucursal, @moneda_fe, @codigo_metodo_pago ,@nombre_destinatario_envio , @identificacion_envio , 
												
												@tipo_identificacion_envio , @correo_envio ,@telefono_envio , @movil_envio , @pais_envio , @provincia_envio,
												
												@canton_envio , @distrito_envio ,@detalle_direccion_envio , @ciudad_envio , @zip_envio , @geo_latitud_envio , 
												
												@geo_longitud_envio ,@nombre_destinatario_fac , @identificacion_fac , @tipo_identificacion_fac , @correo_fac ,@telefono_fac , 
												
												@movil_fac ,@pais_fac , @provincia_fac, @canton_fac, @distrito_fac , @detalle_direccion_fac , 
												
												@ciudad_fac , @zip_fac , @geo_latitud_fac , @geo_longitud_fac,
												
												@tipo_envio, @costo_total_shipping, @tasa_impuesto_shipping, @wish_id,'N' )
					END

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			/*insert into bitacora */
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[AGREGAR_PEDIDOS_LINEA]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Agregar los detalles de los pedidos
CREATE PROC [NIDUX].[AGREGAR_PEDIDOS_LINEA](
@orderId int, @id_producto int, @id_variacion int, @sku varchar(255), @nombre_producto varchar(255), @precio varchar(50), @cantidad int, @porcentaje_descuento varchar(255),
@subtotal_descuento varchar(255), @subtotal_linea varchar(255),@impuesto int, @subtotal_impuestos varchar(255))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

		IF NOT EXISTS(SELECT ORDERID FROM NIDUX.PEDIDOS_LINEA WHERE ORDERID = @orderId)
		BEGIN
			INSERT INTO APLIX_ECOMERCE.NIDUX.PEDIDOS_LINEA ([ORDERID],[ID_PRODUCTO],[ID_VARIACION],[SKU]

													 ,[NOMBRE_PRODUCTO],[PRECIO],[CANTIDAD],[PORCENTAJE_DESCUENTO]

													 ,[SUBTOTAL_DESCUENTO],[SUBTOTAL_LINEA],[IMPUESTO],[SUBTOTAL_IMPUESTOS]) 
											  
											  VALUES (@orderId, @id_producto, @id_variacion, @sku, 

													  @nombre_producto, @precio, @cantidad, @porcentaje_descuento,

													  @subtotal_descuento, @subtotal_linea,@impuesto, @subtotal_impuestos)

		END

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			/*insert into bitacora */
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[AGREGAR_VALORES_ATRIBUTOS_ARTICULOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Agregar los valores del atributos al articulo(VARIACIONES)
CREATE PROC [NIDUX].[AGREGAR_VALORES_ATRIBUTOS_ARTICULOS](@ID_PADRE AS VARCHAR(255))
AS
	BEGIN
		SELECT AR.ARTICULO, AR.ID_VALORES_ATRIBUTOS, AR.PESO, AC.CANTIDAD, AP.PRECIO
			FROM APLIX_ECOMERCE.NIDUX.ARTICULOS AS AR
			INNER JOIN APLIX_ECOMERCE.NIDUX.ARTICULOS_CANTIDAD AS AC ON AR.ARTICULO = AC.ARTICULO
			INNER JOIN APLIX_ECOMERCE.NIDUX.ARTICULOS_PRECIO AS AP ON AR.ARTICULO = AP.ARTICULO
			WHERE AR.ID_PADRE = @ID_PADRE AND AR.ACTIVO = 'S'
	END
GO
/****** Object:  StoredProcedure [NIDUX].[APX_CREDENCIALES_CONEXION_NIDUX]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------------------------------------------
--							Obtener credenciales de conexion
--							y validar el tiempo del token
--  SI EL TOKEN NO A CADUCADO MANDO EL TOKEN EN @MENSAJE SI YA CADUCO MANDO PEDIRTOKEN PARA PEDIRSELO A NIDUX
----------------------------------------------------------------------------------------------------
CREATE PROC [NIDUX].[APX_CREDENCIALES_CONEXION_NIDUX]
AS
BEGIN TRY
	--OBTENGO LA FECHA ACTUAL
	DECLARE @FECHAACTUAL	DATETIME	 = GETDATE()
	--SELECCIONA EL ULTIMO DATO DE LA FECHA REGISTRADO CON EL TOP(1)
	DECLARE @FECHACONSULTA  DATETIME	 = (SELECT TOP(1) FECHA_HORA_TOKEN FROM NIDUX.CREDENCIALES ORDER BY FECHA_HORA_TOKEN DESC)
	--LE SUMO 1 HORA A LA FECHA EN LA QUE SOLICITE EL TOKEN PARA NO SOLICITARLO CADA VEZ QUE HAGO UNA CONSULTA A NIDUX
	DECLARE @HORACADUCIDAD  DATETIME	 = DATEADD(HOUR, 1, @FECHACONSULTA)
	DECLARE @MENSAJE		VARCHAR(MAX) = ''

	--valido que la fechaactual sea mayor o menor a la que se realizo la consulta
	IF(@FECHAACTUAL > @HORACADUCIDAD)
	BEGIN
			SET	@MENSAJE = 'NOT TODAY'
	--	 SELECT @MENSAJE
	END
	ELSE 
	BEGIN 
			SET	@MENSAJE = 'ADELANTE'
	--	 SELECT @MENSAJE
	END

	--Dependiendo del mensaje generado en el if anterior paso las credenciales para volver a pedir el token o no 
	IF(@MENSAJE = 'ADELANTE')
		BEGIN
			--Le paso el token a la variable mensaje
			SET @MENSAJE = (SELECT TOKEN_NIDUX FROM NIDUX.CREDENCIALES WHERE ID = 1)
			SELECT USUARIO, CONTRASENA, STOREID, @MENSAJE AS MENSAJE FROM NIDUX.CREDENCIALES WHERE ID = 1
		END
	ELSE
	BEGIN
		SET @MENSAJE = 'PEDIRTOKEN'
		SELECT USUARIO, CONTRASENA, STOREID, @MENSAJE AS MENSAJE FROM NIDUX.CREDENCIALES WHERE ID = 1
	END
END TRY
BEGIN CATCH
INSERT INTO NIDUX.BITACORA_ERRORES_TABLAS_PROPIAS ( FECHA, PROCEDIMIENTO , ERROR) 
			VALUES (SYSDATETIME(), COALESCE(ERROR_PROCEDURE(), ''), 
			' Linea error: ' + CONVERT(VARCHAR(55),ERROR_LINE())+
			' Mensaje error: ' + ERROR_MESSAGE() +
			' Numero error: ' + CONVERT(VARCHAR(55),ERROR_NUMBER()) +  
			' Severity error: ' + CONVERT(VARCHAR(55),ERROR_SEVERITY()) +
			' Estado error: ' + CONVERT(VARCHAR(55),ERROR_STATE())
			)
END CATCH
GO
/****** Object:  StoredProcedure [NIDUX].[APX_FECHA_ACTUAL]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[APX_FECHA_ACTUAL]
AS

	SELECT GETDATE() AS FECHA
GO
/****** Object:  StoredProcedure [NIDUX].[CARGAR_ARTICULOS_APP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [NIDUX].[CARGAR_ARTICULOS_APP]
AS
	BEGIN
		SELECT AR.ARTICULO,AR.NOMBRE, AR.NOMBRE_NIDUX, AR.DESCRIPCION, AR.DESCRIPCION_NIDUX, AR.PESO,AR.ACTIVO,AR.ESTADO,AR.ID,AR.ID_MARCA,AR.ID_CATEGORIAS,AR.ID_VALORES_ATRIBUTOS,AR.ID_PADRE,AR.ID_HIJO,
            AR.INDICADOR_STOCK,AR.DESTACADO,AR.COSTO_SHIPPING,AR.PERMITE_RESERVA,AR.PORCENTAJE_RESERVA,AR.LIMITE_CARRITO,AR.USAR_GIF,AR.GIF_TIEMPO,AR.VIDEO_YOUTUBE,
            AR.NOMBRE_TRADUC,AR.DESCRIPCION_TRADUC, AR.PESO, AC.CANTIDAD, AP.PRECIO, AP.DESCUENTO, AR.IMPUESTO , TAGS, SEO_TAGS
			FROM APLIX_ECOMERCE.NIDUX.ARTICULOS AR 
			INNER JOIN APLIX_ECOMERCE.NIDUX.ARTICULOS_CANTIDAD AS AC ON AR.ARTICULO = AC.ARTICULO 
            INNER JOIN APLIX_ECOMERCE.NIDUX.ARTICULOS_PRECIO AS AP ON AR.ARTICULO = AP.ARTICULO WHERE AR.ACTIVO = 'S'
	END
GO
/****** Object:  StoredProcedure [NIDUX].[CREDENCIALES_CONEXION]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[CREDENCIALES_CONEXION]
AS
	BEGIN
		SELECT USUARIO, CONTRASENA, STOREID FROM APLIX_ECOMERCE.NIDUX.CREDENCIALES WHERE ID = 1
	END
GO
/****** Object:  StoredProcedure [NIDUX].[DESACTIVAR_ARTICULOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[DESACTIVAR_ARTICULOS]
(
	@ARTICULO VARCHAR(200)
)
AS
	UPDATE CEMACO.ARTICULOS
	   SET ACTIVO = 'N'
	 WHERE ARTICULO = @ARTICULO
GO
/****** Object:  StoredProcedure [NIDUX].[ELIMINAR_ARTICULOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Eliminar Articulos
CREATE PROC [NIDUX].[ELIMINAR_ARTICULOS]
AS
	BEGIN
		SELECT ARTICULO FROM APLIX_ECOMERCE.NIDUX.ARTICULOS WHERE ACTIVO = 'N' AND RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.NIDUX.CREDENCIALES WHERE ID = 1)
	END
GO
/****** Object:  StoredProcedure [NIDUX].[ELIMINAR_ARTICULOS_PADRES]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Eliminar Articulos que son hijos pero que se agregaron como padres
CREATE PROC [NIDUX].[ELIMINAR_ARTICULOS_PADRES]
AS
	BEGIN
		SELECT ARTICULO FROM APLIX_ECOMERCE.NIDUX.ARTICULOS 
			WHERE RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.NIDUX.CREDENCIALES WHERE ID = 1)
			AND ID IS NOT NULL AND ARTICULO != ID_PADRE AND ACTIVO = 'S'
	END
GO
/****** Object:  StoredProcedure [NIDUX].[ELIMINAR_CATEGORIAS_ARTICULO_APP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[ELIMINAR_CATEGORIAS_ARTICULO_APP](@CODIGO AS INT)
AS
	BEGIN
		DELETE FROM APLIX_ECOMERCE.NIDUX.CATEGORIAS WHERE CODIGO_NIDUX = @CODIGO
	END
GO
/****** Object:  StoredProcedure [NIDUX].[ELIMINAR_MARCAS_ARTICULO_APP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[ELIMINAR_MARCAS_ARTICULO_APP](@CODIGO AS INT)
AS
	BEGIN
		DELETE FROM APLIX_ECOMERCE.NIDUX.MARCAS WHERE CODIGO_NIDUX = @CODIGO
	END
GO
/****** Object:  StoredProcedure [NIDUX].[ELIMINAR_VALORES_ATRIBUTOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[ELIMINAR_VALORES_ATRIBUTOS]
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			DELETE FROM APLIX_ECOMERCE.NIDUX.VALORES_ATRIBUTOS 

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[INSERTAR_ARTICULOS_CODISA]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[INSERTAR_ARTICULOS_CODISA](@ARTICULO VARCHAR(255), @NOMBRE VARCHAR(MAX), @DESCRIPCION VARCHAR(MAX), @PESO DECIMAL(28,8), @IMPUESTO DECIMAL(28,8), @CANTIDAD DECIMAl(28,8),
										   @PRECIO DECIMAL(28,8), @DESCUENTO DECIMAL(28,8), @CATEGORIAS VARCHAR(MAX), @ESTADO INT, @MARCA VARCHAR(MAX), @DESTACADO VARCHAR(2), @TAGS VARCHAR(MAX), @SEOTAG VARCHAR(MAX),
										   @VIDEO VARCHAR(MAX), @RECORDDATE DATETIME)
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			IF((SELECT ARTICULO FROM APLIX_ECOMERCE.NIDUX.ARTICULOS WHERE ARTICULO = @ARTICULO) IS NULL)
				BEGIN

					--ARTICULO 
					--con respecto al recorddate si lo inserto lo pongo como GETDATE para que se tome en cuenta en la proxima sincro
					--Si lo actualizo si uso el record date para que tome en cuenta la fecha de la vista
					INSERT INTO APLIX_ECOMERCE.NIDUX.ARTICULOS (ARTICULO, NOMBRE, DESCRIPCION, PESO, IMPUESTO, ACTIVO, 
																
																ID_CATEGORIAS, ESTADO, ID_MARCA, DESTACADO, TAGS, SEO_TAGS, VIDEO_YOUTUBE, RECORDDATE ) 

												  VALUES (@ARTICULO, @NOMBRE, @DESCRIPCION, @PESO, @IMPUESTO, 'S',
												  
														  @CATEGORIAS, @ESTADO, @MARCA, @DESTACADO, @TAGS, @SEOTAG, @VIDEO, GETDATE() )-- todos los articulos lo vamos a poner como activos
					
					--CANTIDAD
					INSERT INTO APLIX_ECOMERCE.NIDUX.ARTICULOS_CANTIDAD (ARTICULO, CANTIDAD, RECORDDATE)

												  VALUES (@ARTICULO, @CANTIDAD, GETDATE())
					--PRECIO
					INSERT INTO APLIX_ECOMERCE.NIDUX.ARTICULOS_PRECIO (ARTICULO, PRECIO, DESCUENTO,RECORDDATE)

												 VALUES (@ARTICULO, @PRECIO, @DESCUENTO, GETDATE())
				END
			ELSE
				BEGIN
					
					--ARTICULO
					UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS
						SET
							NOMBRE = @NOMBRE,
							DESCRIPCION = @DESCRIPCION,
							PESO = @PESO,
							IMPUESTO = @IMPUESTO,
							ID_CATEGORIAS = @CATEGORIAS,
							ESTADO = @ESTADO,
							ID_MARCA = @MARCA,
							DESTACADO = @DESTACADO,
							TAGS = @TAGS,
							SEO_TAGS = @SEOTAG,
							VIDEO_YOUTUBE = @VIDEO,
							RECORDDATE = @RECORDDATE
						WHERE ARTICULO = @ARTICULO

					--CANTIDAD
					UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS_CANTIDAD
						SET
							CANTIDAD = @CANTIDAD,
							RECORDDATE = @RECORDDATE
						WHERE ARTICULO = @ARTICULO

					--PRECIO
					UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS_PRECIO
						SET
							PRECIO = @PRECIO,
							DESCUENTO = @DESCUENTO,
							RECORDDATE = @RECORDDATE
						WHERE ARTICULO = @ARTICULO

				END
						
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[INSERTAR_ARTICULOS_POR_EXCEL]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [NIDUX].[INSERTAR_ARTICULOS_POR_EXCEL]
(
@SKU AS VARCHAR(250),
@NOMBRE_NIDUX AS VARCHAR(MAX),
@DESCRIPCION_NIDUX AS VARCHAR(MAX),
@MARCA AS VARCHAR(200),
@CATEGORIA AS VARCHAR(200),
@PORCENTAJE_RESERVA AS VARCHAR(200),
@PERMITE_RESERVA AS VARCHAR(10),
@DESTACADO AS VARCHAR(10),
@INDICADOR_STOCK AS VARCHAR(10),
@ESTADO AS VARCHAR(5),
@COSTO_SHIPPING AS VARCHAR(200),
@LIMITE_CARRITO AS VARCHAR(100),
@USAR_GIF AS VARCHAR(200),
@TIEMPO_GIF AS VARCHAR(200),
@NOMBRE_TRADUCCION AS VARCHAR(MAX),
@DESCRIPCION_TRADUCCION AS VARCHAR(MAX),
@SINCRONIZA AS VARCHAR(2),
@TAGS AS VARCHAR(4000),
@SEO_TAGS AS VARCHAR(4000)
)
AS
BEGIN

IF ((SELECT ARTICULO FROM APLIX_ECOMERCE.NIDUX.ARTICULOS_PRECIO WHERE ARTICULO = @SKU) IS NULL)
BEGIN
INSERT INTO APLIX_ECOMERCE.NIDUX.ARTICULOS_PRECIO (ARTICULO, PRECIO, DESCUENTO)
VALUES (@SKU, 0 , 0)
END

IF ((SELECT ARTICULO FROM APLIX_ECOMERCE.NIDUX.ARTICULOS_CANTIDAD WHERE ARTICULO = @SKU) IS NULL)
BEGIN
INSERT INTO APLIX_ECOMERCE.NIDUX.ARTICULOS_CANTIDAD(ARTICULO, CANTIDAD)
VALUES (@SKU, 0)
END


IF ((SELECT ARTICULO FROM APLIX_ECOMERCE.NIDUX.ARTICULOS WHERE ARTICULO = @SKU) IS NULL )
BEGIN
INSERT INTO APLIX_ECOMERCE.NIDUX.ARTICULOS
(ARTICULO, NOMBRE_NIDUX, DESCRIPCION_NIDUX, ID_MARCA, ID_CATEGORIAS, 

PORCENTAJE_RESERVA, PERMITE_RESERVA, DESTACADO, INDICADOR_STOCK, ESTADO, 

COSTO_SHIPPING, LIMITE_CARRITO, USAR_GIF, GIF_TIEMPO, NOMBRE_TRADUC, 

DESCRIPCION_TRADUC, ACTIVO, TAGS, SEO_TAGS)

VALUES (

@SKU, @NOMBRE_NIDUX, @DESCRIPCION_NIDUX, @MARCA, @CATEGORIA,

@PORCENTAJE_RESERVA, @PERMITE_RESERVA, @DESTACADO, @INDICADOR_STOCK, @ESTADO, 

@COSTO_SHIPPING, @LIMITE_CARRITO, @USAR_GIF, @TIEMPO_GIF, @NOMBRE_TRADUCCION,

@DESCRIPCION_TRADUCCION, @SINCRONIZA, @TAGS, @SEO_TAGS

)

END
ELSE 
BEGIN
UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS SET 

NOMBRE_NIDUX			= @NOMBRE_NIDUX,
DESCRIPCION_NIDUX		= @DESCRIPCION_NIDUX,
ID_MARCA				= @MARCA,
ID_CATEGORIAS			= @CATEGORIA,
PORCENTAJE_RESERVA		= @PORCENTAJE_RESERVA,
PERMITE_RESERVA			= @PERMITE_RESERVA,
DESTACADO				= @DESTACADO,
INDICADOR_STOCK			= @INDICADOR_STOCK,
ESTADO					= @ESTADO,
COSTO_SHIPPING			= @COSTO_SHIPPING,
LIMITE_CARRITO			= @LIMITE_CARRITO,
USAR_GIF				= @USAR_GIF,
GIF_TIEMPO				= @TIEMPO_GIF,
NOMBRE_TRADUC			= @NOMBRE_TRADUCCION,
DESCRIPCION_TRADUC		= @DESCRIPCION_TRADUCCION,
ACTIVO					= @SINCRONIZA,
TAGS					= @TAGS,
SEO_TAGS				= @SEO_TAGS
WHERE ARTICULO = @SKU

END

END
GO
/****** Object:  StoredProcedure [NIDUX].[INSERTAR_ARTICULOS_TIENDA_APP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[INSERTAR_ARTICULOS_TIENDA_APP](@ID VARCHAR(255), @ID_MARCA VARCHAR(255), @SKU VARCHAR(255), @NOMBRE VARCHAR(MAX), 
										 @DESCRIPCION VARCHAR(MAX), @PRECIO VARCHAR(255), @COSTO_SHIPPING VARCHAR(255), @PESO VARCHAR(255), 
										 @OFERTA VARCHAR(255), @ESTADO VARCHAR(255), @DESTACADO VARCHAR(255), @STOCK INT,
										 @VIDEO VARCHAR(255), @INDICADOR VARCHAR(255), @RESERVA VARCHAR(255), @CARRITO VARCHAR(255), 
										 @POR_RESERVA VARCHAR(255), @USAR_GIF VARCHAR(255), @TIEMPO_GIF VARCHAR(255), @CATEGORIAS VARCHAR(255), 
										 @LANG_NOMBRE VARCHAR(255), @LANG_DESCRIP VARCHAR(255), @IMPUESTO VARCHAR(255), @TAGS VARCHAR(4000), @SEO_TAGS VARCHAR(4000))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			--seteamos las variables para sus nuevo valores
			IF @INDICADOR = '1'
				BEGIN
					SET @INDICADOR = 'S'
				END
			ELSE
				BEGIN
					SET @INDICADOR = 'N'
				END

			IF @DESTACADO = '1'
				BEGIN
					SET @DESTACADO = 'S'
				END
			ELSE
				BEGIN
					SET @DESTACADO = 'N'
				END

			IF @RESERVA = '1'
				BEGIN
					SET @RESERVA = 'S'
				END
			ELSE
				BEGIN
					SET @RESERVA = 'N'
				END

			IF @USAR_GIF = '1'
				BEGIN
					SET @USAR_GIF = 'S'
				END
			ELSE
				BEGIN
					SET @USAR_GIF = 'N'
				END

			IF((SELECT ARTICULO FROM APLIX_ECOMERCE.NIDUX.ARTICULOS WHERE ARTICULO = @SKU) IS NULL)
				BEGIN
					--insertamos en la tabla articulos
					INSERT INTO APLIX_ECOMERCE.NIDUX.ARTICULOS(ARTICULO, NOMBRE, DESCRIPCION, PESO, ACTIVO, ESTADO, ID,
												 
														 ID_MARCA, ID_CATEGORIAS, ID_VALORES_ATRIBUTOS, ID_PADRE,
												 
														 ID_HIJO, INDICADOR_STOCK, DESTACADO, COSTO_SHIPPING,
												 
														 PERMITE_RESERVA, PORCENTAJE_RESERVA, LIMITE_CARRITO,
												 
														 USAR_GIF, GIF_TIEMPO, VIDEO_YOUTUBE, ID_TRADUC, NOMBRE_TRADUC,
												 
														 DESCRIPCION_TRADUC,NOMBRE_NIDUX, DESCRIPCION_NIDUX, IMPUESTO , TAGS, SEO_TAGS) 
			
												  VALUES(@SKU, @NOMBRE, @DESCRIPCION, CONVERT(DECIMAL(28,8),@PESO), 'S' , @ESTADO, @ID,

														 @ID_MARCA, @CATEGORIAS, NULL, NULL,
												 
														 NULL, @INDICADOR, @DESTACADO, CONVERT(DECIMAL(28,8),@COSTO_SHIPPING),
												 
														 @RESERVA, CONVERT(DECIMAL(28,8),@POR_RESERVA), CONVERT(INT, @CARRITO),
												 
														 @USAR_GIF, CONVERT(INT,@TIEMPO_GIF), @VIDEO,  1, @LANG_NOMBRE,
												 
														 @LANG_DESCRIP, @NOMBRE, @DESCRIPCION, CONVERT(DECIMAL(28,8),@IMPUESTO) , @TAGS, @SEO_TAGS )


					--insertamos en articulo cantidad
					INSERT INTO APLIX_ECOMERCE.NIDUX.ARTICULOS_CANTIDAD(ARTICULO, CANTIDAD) VALUES(@SKU, CONVERT(DECIMAL(28,8),@STOCK))

					--insertamos en articulos precio
					INSERT INTO APLIX_ECOMERCE.NIDUX.ARTICULOS_PRECIO(ARTICULO, PRECIO, DESCUENTO) VALUES(@SKU, CONVERT(DECIMAL(28,8),@PRECIO), CONVERT(DECIMAL(28,8),@OFERTA))
				END
			ELSE
				BEGIN
					--actualizamos el articulo porque ya exite en la tabla
					UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS
						SET
							NOMBRE = @NOMBRE, 
							DESCRIPCION = @DESCRIPCION, 
							PESO = CONVERT(DECIMAL(28,8),@PESO), 
							ACTIVO = 'S', 
							ESTADO = @ESTADO, 
							ID = @ID,
							ID_MARCA = @ID_MARCA, 
							ID_CATEGORIAS = @CATEGORIAS, 
							IMPUESTO = CONVERT(DECIMAL(28,8),@IMPUESTO),
							ID_VALORES_ATRIBUTOS = NULL, 
							ID_PADRE = NULL,
							ID_HIJO = NULL, 
							INDICADOR_STOCK = @INDICADOR, 
							DESTACADO = @DESTACADO, 
							COSTO_SHIPPING = CONVERT(DECIMAL(28,8),@COSTO_SHIPPING),
							PERMITE_RESERVA = @RESERVA,
							PORCENTAJE_RESERVA = CONVERT(DECIMAL(28,8),@POR_RESERVA), 
							LIMITE_CARRITO = CONVERT(INT, @CARRITO),
							USAR_GIF = @USAR_GIF, 
							GIF_TIEMPO = CONVERT(INT,@TIEMPO_GIF),
							VIDEO_YOUTUBE = @VIDEO, 
							ID_TRADUC = 1, 
							NOMBRE_TRADUC = @LANG_NOMBRE,
							DESCRIPCION_TRADUC = @LANG_DESCRIP,
							NOMBRE_NIDUX = @NOMBRE, 
							DESCRIPCION_NIDUX = @DESCRIPCION,
							TAGS = @TAGS,
							SEO_TAGS = @SEO_TAGS
						WHERE ARTICULO = @SKU

					UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS_CANTIDAD
						SET
							CANTIDAD = CONVERT(DECIMAL(28,8),@STOCK)
						WHERE ARTICULO = @SKU

					UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS_PRECIO
						SET
							PRECIO = CONVERT(DECIMAL(28,8),@PRECIO),
							DESCUENTO = CONVERT(DECIMAL(28,8),@OFERTA)
						WHERE ARTICULO = @SKU

				END

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[INSERTAR_ARTICULOS_VARIACIONES_TIENDA_APP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[INSERTAR_ARTICULOS_VARIACIONES_TIENDA_APP](@SKU_PADRE VARCHAR(255), @ID VARCHAR(255), @NOMBRE VARCHAR(255), 
										 @ATRIBUTOS VARCHAR(255), @SKU VARCHAR(255), @PRECIO VARCHAR(255), @STOCK VARCHAR(255), 
										 @PESO VARCHAR(255), @IMPUESTO VARCHAR(255))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			--hacemos el cambio de las variaciones por el codigo
			DECLARE @CONTADOR AS INT = 0
			DECLARE @CANT INT
			DECLARE @VARIACION_FINAL VARCHAR(255)

			SELECT @CANT = COUNT(ID) FROM APLIX_ECOMERCE.NIDUX.VALORES_ATRIBUTOS WHERE DESCRIPCION IN ( select * from NIDUX.BUSCAR_VARIACIONES_ARTICULOS(@ATRIBUTOS))
			SELECT ID INTO #TEMP FROM APLIX_ECOMERCE.NIDUX.VALORES_ATRIBUTOS WHERE DESCRIPCION IN ( select * from NIDUX.BUSCAR_VARIACIONES_ARTICULOS(@ATRIBUTOS))

			WHILE(@CONTADOR < @CANT)
				BEGIN
					DECLARE @CODIGO AS INT = (SELECT TOP(1) ID FROM #TEMP)
					SET @VARIACION_FINAL = CONCAT(@CODIGO, ',', @VARIACION_FINAL);
					DELETE #TEMP WHERE ID = @CODIGO
					SET @CONTADOR = @CONTADOR + 1;
				END
			SET @VARIACION_FINAL = REPLACE(@VARIACION_FINAL + '<END>', ',<END>', '')
			--print @VARIACION_FINAL

			--revisamos si la variacion es igual que el padre
			IF((SELECT ARTICULO FROM APLIX_ECOMERCE.NIDUX.ARTICULOS WHERE ARTICULO = @SKU) IS NULL)--------AQUI HABIA UNA S DE ACTIVO TENFO QUE QUITARLO EN EL OTRO DOCUMENTO VIEJO DE SP
				BEGIN

					--insertamos en la tabla articulos
							INSERT INTO APLIX_ECOMERCE.NIDUX.ARTICULOS(ARTICULO, NOMBRE, NOMBRE_NIDUX, PESO, ACTIVO,
												 
																 ID_VALORES_ATRIBUTOS, ID_PADRE, ID_HIJO, IMPUESTO) 
			
														  VALUES(@SKU, @NOMBRE, @NOMBRE, CONVERT(DECIMAL(28,8),@PESO), 'S',
												  
																 @VARIACION_FINAL,@SKU_PADRE, @ID, @IMPUESTO)


							--insertamos en articulo cantidad
							INSERT INTO APLIX_ECOMERCE.NIDUX.ARTICULOS_CANTIDAD(ARTICULO, CANTIDAD) VALUES(@SKU, CONVERT(DECIMAL(28,8),@STOCK))

							--seleccionamos el descuento del padre, ya que es un hijo y este tiene que heredar el descuento
							DECLARE @DESCUENTO DECIMAL(28,8)
							SELECT @DESCUENTO = DESCUENTO FROM APLIX_ECOMERCE.NIDUX.ARTICULOS_PRECIO WHERE ARTICULO = @SKU_PADRE

							IF @DESCUENTO IS NOT NULL
								BEGIN
									--insertamos en articulos precio
									INSERT INTO APLIX_ECOMERCE.NIDUX.ARTICULOS_PRECIO(ARTICULO, PRECIO, DESCUENTO) VALUES(@SKU, CONVERT(DECIMAL(28,8),@PRECIO), @DESCUENTO)
								END
							ELSE
								BEGIN
									--insertamos en articulos precio
									INSERT INTO APLIX_ECOMERCE.NIDUX.ARTICULOS_PRECIO(ARTICULO, PRECIO, DESCUENTO) VALUES(@SKU, CONVERT(DECIMAL(28,8),@PRECIO), 0)
								END
				END
			ELSE
				BEGIN
					--actualizamos el articulo porque ya exite en la tabla como padre
					UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS
						SET
							ID_VALORES_ATRIBUTOS = @VARIACION_FINAL,
							ID_PADRE = @SKU_PADRE,
							ID_HIJO = @ID,
							ACTIVO = 'S',
							PESO = CONVERT(DECIMAL(28,8),@PESO)
						WHERE ARTICULO = @SKU

					UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS_CANTIDAD
						SET
							CANTIDAD = CONVERT(DECIMAL(28,8),@STOCK)
						WHERE ARTICULO = @SKU

					UPDATE APLIX_ECOMERCE.NIDUX.ARTICULOS_PRECIO
						SET
							PRECIO = CONVERT(DECIMAL(28,8),@PRECIO)
						WHERE ARTICULO = @SKU

				END
			

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[INSERTAR_ATRIBUTOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[INSERTAR_ATRIBUTOS](@ID AS INT, @DESCRIPCION AS VARCHAR(150))
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			IF((SELECT ID FROM APLIX_ECOMERCE.NIDUX.ATRIBUTOS WHERE DESCRIPCION LIKE CONCAT(@DESCRIPCION,'%')) IS NULL)
				BEGIN
					--NO EXISTE EL ATRIBUTO, INSERTAMOS
					INSERT INTO APLIX_ECOMERCE.NIDUX.ATRIBUTOS (ID, DESCRIPCION) VALUES (@ID, @DESCRIPCION)
				END
			ELSE
				BEGIN
					--SI EXISTE EL ATRIBUTO, ACTUALIZAMOS
					UPDATE APLIX_ECOMERCE.NIDUX.ATRIBUTOS
						SET
							ID = @ID
						WHERE DESCRIPCION = @DESCRIPCION
				END
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[INSERTAR_CATEGORIAS_APP_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[INSERTAR_CATEGORIAS_APP_SIMPLE](@NOMBRE VARCHAR(MAX), @DESCRIPCION VARCHAR(MAX), @CODIGO INT, @CODIGO_PADRE INT)
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			INSERT INTO APLIX_ECOMERCE.NIDUX.CATEGORIAS (NOMBRE, DESCRIPCION, CODIGO_NIDUX, SUBCATEGORIA_NIDUX)

								   VALUES(@NOMBRE,@DESCRIPCION, @CODIGO, @CODIGO_PADRE)
			
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[INSERTAR_CATEGORIAS_CODISA]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[INSERTAR_CATEGORIAS_CODISA]
AS
	BEGIN
		SELECT CASE
			WHEN CC.SUBCATEGORIA_NIDUX != 0 THEN SUBCATEGORIA_NIDUX
			ELSE CC.CODIGO_NIDUX END AS CODIGO_NIDUX,
			CASE 
			WHEN CC.SUBCATEGORIA_NIDUX = 0 THEN CC.NOMBRE
			ELSE (SELECT NOMBRE FROM APLIX_ECOMERCE.NIDUX.CATEGORIAS WHERE CODIGO_NIDUX = CC.SUBCATEGORIA_NIDUX)  END NOMBRE_CAT, 
			CASE
			WHEN CC.SUBCATEGORIA_NIDUX = 0 THEN 0
			ELSE CC.CODIGO_NIDUX END AS SUBCATEGORIA_NIDUX,
			CASE
			WHEN CC.SUBCATEGORIA_NIDUX = 0 THEN ''
			ELSE CC.NOMBRE END AS SUBNOMBRE_CAT
			FROM APLIX_ECOMERCE.NIDUX.CATEGORIAS CC
			WHERE RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.NIDUX.CREDENCIALES WHERE ID = 1)

		 --SELECT CASE 
			--	WHEN CC.SUBCATEGORIA_NIDUX = 0 THEN CC.NOMBRE
			--	ELSE (SELECT NOMBRE FROM APLIX_ECOMERCE.NIDUX.CATEGORIAS WHERE CODIGO_NIDUX = CC.SUBCATEGORIA_NIDUX)  END NOMBRE_CAT, 
			--  CC.CODIGO_NIDUX, CC.SUBCATEGORIA_NIDUX,
			--   CASE
			--	WHEN CC.SUBCATEGORIA_NIDUX = 0 THEN ''
			--	ELSE CC.NOMBRE END AS SUBNOMBRE_CAT FROM APLIX_ECOMERCE.NIDUX.CATEGORIAS CC
			--WHERE RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.NIDUX.CREDENCIALES WHERE ID = 1) --ACTIVO = 'S' AND
	END
GO
/****** Object:  StoredProcedure [NIDUX].[INSERTAR_CATEGORIAS_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[INSERTAR_CATEGORIAS_SIMPLE](@NOMBRE VARCHAR(MAX), @DESCRIPCION VARCHAR(MAX), @CODIGO INT, @SUBCATEGORIA INT) 
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		--INSERTA SI NO EXISTE LA CATEGORIA, SINO LA ACTUALIZA
			IF((SELECT CODIGO_NIDUX FROM NIDUX.CATEGORIAS WHERE CODIGO_NIDUX = @CODIGO) IS NULL)
				BEGIN
					INSERT INTO NIDUX.CATEGORIAS (NOMBRE, DESCRIPCION, CODIGO_NIDUX, SUBCATEGORIA_NIDUX)

								   VALUES(@NOMBRE,@DESCRIPCION, @CODIGO, @SUBCATEGORIA)
				END
			ELSE
				BEGIN
					UPDATE NIDUX.CATEGORIAS
					SET
						NOMBRE = @NOMBRE,
						DESCRIPCION = @DESCRIPCION
					WHERE CODIGO_NIDUX = @CODIGO
				END
			
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[INSERTAR_ID_WiSH]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[INSERTAR_ID_WiSH](
	@WISH_ID INT,
	@ORDERID INT
)
AS
	IF EXISTS(SELECT ORDERID FROM NIDUX.PEDIDOS WHERE ORDERID = @ORDERID)
	BEGIN
		UPDATE NIDUX.PEDIDOS
		   SET WISH_ID = @WISH_ID
		 WHERE ORDERID = @ORDERID
	END
GO
/****** Object:  StoredProcedure [NIDUX].[INSERTAR_MARCAS_APP_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[INSERTAR_MARCAS_APP_SIMPLE](@NOMBRE VARCHAR(255), @ID INT)
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			INSERT INTO APLIX_ECOMERCE.NIDUX.MARCAS(DESCRIPCION_NIDUX, CODIGO_NIDUX) VALUES (@NOMBRE, @ID)

		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[INSERTAR_MARCAS_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[INSERTAR_MARCAS_SIMPLE](@NOMBRE VARCHAR(MAX), @CODIGO INT) 
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		--INSERTA SI NO EXISTE LA MARCA, SINO LA ACTUALIZA
			IF((SELECT CODIGO_NIDUX FROM NIDUX.MARCAS WHERE CODIGO_NIDUX = @CODIGO) IS NULL)
				BEGIN
					INSERT INTO NIDUX.MARCAS (DESCRIPCION_NIDUX, CODIGO_NIDUX)

								   VALUES(@NOMBRE, @CODIGO)
				END
			ELSE
				BEGIN
					UPDATE NIDUX.MARCAS
					SET
						DESCRIPCION_NIDUX = @NOMBRE
					WHERE CODIGO_NIDUX = @CODIGO
				END
			
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[INSERTAR_VALORES_ATRIBUTOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[INSERTAR_VALORES_ATRIBUTOS](@ID_VALOR AS INT, @DESCRIPCION AS VARCHAR(150), @ID_ATRIBUTO AS INT)
AS
	BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			INSERT INTO APLIX_ECOMERCE.NIDUX.VALORES_ATRIBUTOS (ID, DESCRIPCION, ID_ATRIBUTO) VALUES (@ID_VALOR, @DESCRIPCION, @ID_ATRIBUTO)
			
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
			DECLARE  @ErrorMessage  NVARCHAR(4000),  
             @ErrorSeverity INT,    
             @ErrorState    INT;    
			SELECT @ErrorMessage  = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(),   @ErrorState   = ERROR_STATE();
			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
	END
GO
/****** Object:  StoredProcedure [NIDUX].[MODIFICAR_CATEGORIAS_NIDUX_SIMPLE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [NIDUX].[MODIFICAR_CATEGORIAS_NIDUX_SIMPLE]
AS
	BEGIN
		SELECT NOMBRE, DESCRIPCION, CODIGO_NIDUX, SUBCATEGORIA_NIDUX FROM NIDUX.CATEGORIAS WHERE RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.NIDUX.CREDENCIALES WHERE ID = 1)
	END
GO
/****** Object:  StoredProcedure [NIDUX].[MOSTRAR_ARTICULOS_PADRE]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Obtener los articulos padres
CREATE PROC [NIDUX].[MOSTRAR_ARTICULOS_PADRE]
AS
	BEGIN
		SELECT a.ID_PADRE as ARTICULO , ar.ID FROM (SELECT ID_PADRE FROM APLIX_ECOMERCE.NIDUX.ARTICULOS 
								WHERE RECORDDATE >= (SELECT FECHA_CONSULTA FROM APLIX_ECOMERCE.NIDUX.CREDENCIALES WHERE ID = 1) AND ACTIVO = 'S' AND ID_PADRE IS NOT NULL GROUP BY ID_PADRE) as a
								INNER JOIN APLIX_ECOMERCE.NIDUX.ARTICULOS as ar ON a.ID_PADRE = ar.ARTICULO
	END
GO
/****** Object:  StoredProcedure [NIDUX].[OBTENER_FILTRO_ARTICULOS_TP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [NIDUX].[OBTENER_FILTRO_ARTICULOS_TP]
--TP = TABLAS PROPIAS
AS
BEGIN
	SELECT TOP (1) * FROM APLIX_ECOMERCE.NIDUX.FILTRO_ARTICULO_TABLAS_PROPIAS
END
GO
/****** Object:  StoredProcedure [NIDUX].[OBTENER_FILTRO_PEDIDOS_TP]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [NIDUX].[OBTENER_FILTRO_PEDIDOS_TP]
--TP = TABLAS PROPIAS
AS
BEGIN
	SELECT TOP (1) * FROM APLIX_ECOMERCE.NIDUX.FILTRO_PEDIDOS_TABLAS_PROPIAS
END
GO
/****** Object:  StoredProcedure [NIDUX].[TRAER_ATRIBUTOS_EXCEL]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [NIDUX].[TRAER_ATRIBUTOS_EXCEL]
AS
BEGIN
select 

ID, DESCRIPCION , (SELECT DESCRIPCION  FROM APLIX_ECOMERCE.NIDUX.ATRIBUTOS WHERE ID = VA.ID_ATRIBUTO) AS ATRIBUTO

from APLIX_ECOMERCE.NIDUX.VALORES_ATRIBUTOS VA

ORDER BY VA.ID_ATRIBUTO

END 
GO
/****** Object:  StoredProcedure [NIDUX].[TRAER_CATEGORIAS_EXCEL]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [NIDUX].[TRAER_CATEGORIAS_EXCEL]
AS
BEGIN

SELECT CA.CODIGO_NIDUX,CA.NOMBRE,
(SELECT NOMBRE AS PADRE FROM NIDUX.CATEGORIAS WHERE CODIGO_NIDUX = CA.SUBCATEGORIA_NIDUX ) AS PADRE
FROM
NIDUX.CATEGORIAS CA 
INNER JOIN 
NIDUX.CATEGORIAS CT
ON CA.CODIGO_NIDUX = CT.CODIGO_NIDUX 

END
GO
/****** Object:  StoredProcedure [NIDUX].[TRAER_ESTADOS_ARTICULOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [NIDUX].[TRAER_ESTADOS_ARTICULOS]
AS
BEGIN
SELECT ID, DESCRIPCION  FROM APLIX_ECOMERCE.NIDUX.ARTICULO_ESTADO
END
GO
/****** Object:  StoredProcedure [NIDUX].[TRAER_MARCAS_EXCEL]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Traemos las marcas al excelde nidux
CREATE   PROC [NIDUX].[TRAER_MARCAS_EXCEL]
AS
BEGIN
SELECT CODIGO_NIDUX AS CODIGO, DESCRIPCION_NIDUX FROM APLIX_ECOMERCE.NIDUX.MARCAS
END
GO
/****** Object:  StoredProcedure [NIDUX].[VALIDAR_ATRIBUTOS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [NIDUX].[VALIDAR_ATRIBUTOS](
@ID AS INT 
)
AS
BEGIN

DECLARE @MEN AS VARCHAR(2)

IF ((SELECT ID FROM APLIX_ECOMERCE.NIDUX.VALORES_ATRIBUTOS WHERE ID = @ID) IS NOT NULL)
BEGIN
SET @MEN = 'S'
END
ELSE
BEGIN
SET @MEN = 'N'
END

SELECT @MEN AS MENSAJE

END
GO
/****** Object:  StoredProcedure [NIDUX].[VALIDAR_CATEGORIAS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [NIDUX].[VALIDAR_CATEGORIAS](
@ID AS INT 
)
AS
BEGIN

DECLARE @MEN AS VARCHAR(2)

IF ((SELECT CODIGO_NIDUX FROM APLIX_ECOMERCE.NIDUX.CATEGORIAS WHERE CODIGO_NIDUX = @ID) IS NOT NULL)
BEGIN
SET @MEN = 'S'
END
ELSE
BEGIN
SET @MEN = 'N'
END

SELECT @MEN AS MENSAJE

END
GO
/****** Object:  StoredProcedure [NIDUX].[VALIDAR_MARCAS]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [NIDUX].[VALIDAR_MARCAS](
@ID AS INT 
)
AS
BEGIN

DECLARE @MEN AS VARCHAR(2)

IF ((SELECT CODIGO_NIDUX FROM APLIX_ECOMERCE.NIDUX.MARCAS WHERE CODIGO_NIDUX = @ID) IS NOT NULL)
BEGIN
SET @MEN = 'S'
END
ELSE
BEGIN
SET @MEN = 'N'
END

SELECT @MEN AS MENSAJE

END
GO
/****** Object:  Trigger [CEMACO].[tgr_update_articulo_estado]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [CEMACO].[tgr_update_articulo_estado]
ON [CEMACO].[ARTICULO_ESTADO]
AFTER UPDATE AS
  UPDATE AE
	SET RECORDDATE = GETDATE()
	FROM CEMACO.ARTICULO_ESTADO AS AE
	INNER JOIN inserted i ON i.ID = AE.ID
GO
ALTER TABLE [CEMACO].[ARTICULO_ESTADO] ENABLE TRIGGER [tgr_update_articulo_estado]
GO
/****** Object:  Trigger [CEMACO].[tgr_update_articulos]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [CEMACO].[tgr_update_articulos]
ON [CEMACO].[ARTICULOS]
AFTER UPDATE AS
SELECT * FROM NIDUX.ARTICULOS
 -- UPDATE AR
	--SET AR.RECORDDATE = GETDATE()
	--FROM CEMACO.ARTICULOS AS AR
	--INNER JOIN inserted i ON i.ARTICULO = AR.ARTICULO
GO
ALTER TABLE [CEMACO].[ARTICULOS] ENABLE TRIGGER [tgr_update_articulos]
GO
/****** Object:  Trigger [CEMACO].[tgr_update_articulos_cantidad]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [CEMACO].[tgr_update_articulos_cantidad]
ON [CEMACO].[ARTICULOS_CANTIDAD]
AFTER UPDATE AS
  UPDATE AC
	SET RECORDDATE = GETDATE()
    FROM CEMACO.ARTICULOS_CANTIDAD AS AC
	INNER JOIN inserted i ON i.ARTICULO = AC.ARTICULO
GO
ALTER TABLE [CEMACO].[ARTICULOS_CANTIDAD] ENABLE TRIGGER [tgr_update_articulos_cantidad]
GO
/****** Object:  Trigger [CEMACO].[tgr_update_articulos_precio]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [CEMACO].[tgr_update_articulos_precio]
ON [CEMACO].[ARTICULOS_PRECIO]
AFTER UPDATE AS
  UPDATE AP
	SET RECORDDATE = GETDATE()
	FROM CEMACO.ARTICULOS_PRECIO AS AP
	INNER JOIN inserted i ON i.ARTICULO = AP.ARTICULO
GO
ALTER TABLE [CEMACO].[ARTICULOS_PRECIO] ENABLE TRIGGER [tgr_update_articulos_precio]
GO
/****** Object:  Trigger [CEMACO].[tgr_update_atributos]    Script Date: 17/12/2024 15:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [CEMACO].[tgr_update_atributos]
ON [CEMACO].[ATRIBUTOS]
AFTER UPDATE AS
  UPDATE CEMACO.ATRIBUTOS
	SET RECORDDATE = GETDATE()
	FROM CEMACO.ATRIBUTOS AS AA
	INNER JOIN inserted i ON i.ID = AA.ID
GO
ALTER TABLE [CEMACO].[ATRIBUTOS] ENABLE TRIGGER [tgr_update_atributos]
GO
/****** Object:  Trigger [CEMACO].[tgr_update_categorias_simple]    Script Date: 17/12/2024 15:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [CEMACO].[tgr_update_categorias_simple]
ON [CEMACO].[CATEGORIAS]
AFTER UPDATE AS
  UPDATE CA
	SET RECORDDATE = GETDATE()
	FROM CEMACO.CATEGORIAS AS CA
	INNER JOIN inserted i ON i.CODIGO_NIDUX = CA.CODIGO_NIDUX
GO
ALTER TABLE [CEMACO].[CATEGORIAS] ENABLE TRIGGER [tgr_update_categorias_simple]
GO
/****** Object:  Trigger [CEMACO].[tgr_update_marcas]    Script Date: 17/12/2024 15:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [CEMACO].[tgr_update_marcas]
ON [CEMACO].[MARCAS]
AFTER UPDATE AS
  UPDATE MA
	SET RECORDDATE = GETDATE()
	FROM CEMACO.MARCAS AS MA
	INNER JOIN inserted i ON i.CODIGO_NIDUX = MA.CODIGO_NIDUX
GO
ALTER TABLE [CEMACO].[MARCAS] ENABLE TRIGGER [tgr_update_marcas]
GO
/****** Object:  Trigger [CEMACO].[tgr_update_pedidos]    Script Date: 17/12/2024 15:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [CEMACO].[tgr_update_pedidos]
ON [CEMACO].[PEDIDOS]
AFTER UPDATE AS
  UPDATE PE
	SET RECORDDATE = GETDATE()
    FROM CEMACO.PEDIDOS AS PE
	INNER JOIN inserted i ON i.ORDERID = PE.ORDERID
GO
ALTER TABLE [CEMACO].[PEDIDOS] ENABLE TRIGGER [tgr_update_pedidos]
GO
/****** Object:  Trigger [CEMACO].[tgr_update_pedidos_linea]    Script Date: 17/12/2024 15:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [CEMACO].[tgr_update_pedidos_linea]
ON [CEMACO].[PEDIDOS_LINEA]
AFTER UPDATE AS
  UPDATE PE
	SET RECORDDATE = GETDATE()
	FROM CEMACO.PEDIDOS_LINEA AS PE
	INNER JOIN inserted i ON i.ORDERID = PE.ORDERID
GO
ALTER TABLE [CEMACO].[PEDIDOS_LINEA] ENABLE TRIGGER [tgr_update_pedidos_linea]
GO
/****** Object:  Trigger [NIDUX].[tgr_update_articulo_estado]    Script Date: 17/12/2024 15:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [NIDUX].[tgr_update_articulo_estado]
ON [NIDUX].[ARTICULO_ESTADO]
AFTER UPDATE AS
  UPDATE AE
	SET RECORDDATE = GETDATE()
	FROM NIDUX.ARTICULO_ESTADO AS AE
	INNER JOIN inserted i ON i.ID = AE.ID
GO
ALTER TABLE [NIDUX].[ARTICULO_ESTADO] ENABLE TRIGGER [tgr_update_articulo_estado]
GO
/****** Object:  Trigger [NIDUX].[tgr_update_articulos]    Script Date: 17/12/2024 15:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [NIDUX].[tgr_update_articulos]
ON [NIDUX].[ARTICULOS]
AFTER UPDATE AS

SELECT * FROM NIDUX.ARTICULOS
 -- UPDATE AR
	--SET AR.RECORDDATE = GETDATE()
	--FROM NIDUX.ARTICULOS AS AR
	--INNER JOIN inserted i ON i.ARTICULO = AR.ARTICULO
GO
ALTER TABLE [NIDUX].[ARTICULOS] ENABLE TRIGGER [tgr_update_articulos]
GO
/****** Object:  Trigger [NIDUX].[tgr_update_articulos_cantidad]    Script Date: 17/12/2024 15:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trigger para actualizar el recorddate Articulos cantidad
CREATE TRIGGER [NIDUX].[tgr_update_articulos_cantidad]
ON [NIDUX].[ARTICULOS_CANTIDAD]
AFTER UPDATE AS
  UPDATE AC
	SET RECORDDATE = GETDATE()
    FROM NIDUX.ARTICULOS_CANTIDAD AS AC
	INNER JOIN inserted i ON i.ARTICULO = AC.ARTICULO
GO
ALTER TABLE [NIDUX].[ARTICULOS_CANTIDAD] ENABLE TRIGGER [tgr_update_articulos_cantidad]
GO
/****** Object:  Trigger [NIDUX].[tgr_update_articulos_precio]    Script Date: 17/12/2024 15:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [NIDUX].[tgr_update_articulos_precio]
ON [NIDUX].[ARTICULOS_PRECIO]
AFTER UPDATE AS
  UPDATE AP
	SET RECORDDATE = GETDATE()
	FROM NIDUX.ARTICULOS_PRECIO AS AP
	INNER JOIN inserted i ON i.ARTICULO = AP.ARTICULO
GO
ALTER TABLE [NIDUX].[ARTICULOS_PRECIO] ENABLE TRIGGER [tgr_update_articulos_precio]
GO
/****** Object:  Trigger [NIDUX].[tgr_update_atributos]    Script Date: 17/12/2024 15:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [NIDUX].[tgr_update_atributos]
ON [NIDUX].[ATRIBUTOS]
AFTER UPDATE AS
  UPDATE NIDUX.ATRIBUTOS
	SET RECORDDATE = GETDATE()
	FROM NIDUX.ATRIBUTOS AS AA
	INNER JOIN inserted i ON i.ID = AA.ID
GO
ALTER TABLE [NIDUX].[ATRIBUTOS] ENABLE TRIGGER [tgr_update_atributos]
GO
/****** Object:  Trigger [NIDUX].[tgr_update_categorias_simple]    Script Date: 17/12/2024 15:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Trigger para actualizar el recorddate categorias 
CREATE TRIGGER [NIDUX].[tgr_update_categorias_simple]
ON [NIDUX].[CATEGORIAS]
AFTER UPDATE AS
  UPDATE CA
	SET RECORDDATE = GETDATE()
	FROM NIDUX.CATEGORIAS AS CA
	INNER JOIN inserted i ON i.CODIGO_NIDUX = CA.CODIGO_NIDUX
GO
ALTER TABLE [NIDUX].[CATEGORIAS] ENABLE TRIGGER [tgr_update_categorias_simple]
GO
/****** Object:  Trigger [NIDUX].[tgr_update_marcas]    Script Date: 17/12/2024 15:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [NIDUX].[tgr_update_marcas]
ON [NIDUX].[MARCAS]
AFTER UPDATE AS
  UPDATE MA
	SET RECORDDATE = GETDATE()
	FROM NIDUX.MARCAS AS MA
	INNER JOIN inserted i ON i.CODIGO_NIDUX = MA.CODIGO_NIDUX
GO
ALTER TABLE [NIDUX].[MARCAS] ENABLE TRIGGER [tgr_update_marcas]
GO
/****** Object:  Trigger [NIDUX].[tgr_update_pedidos]    Script Date: 17/12/2024 15:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [NIDUX].[tgr_update_pedidos]
ON [NIDUX].[PEDIDOS]
AFTER UPDATE AS
  UPDATE PE
	SET RECORDDATE = GETDATE()
    FROM NIDUX.PEDIDOS AS PE
	INNER JOIN inserted i ON i.ORDERID = PE.ORDERID
GO
ALTER TABLE [NIDUX].[PEDIDOS] ENABLE TRIGGER [tgr_update_pedidos]
GO
/****** Object:  Trigger [NIDUX].[tgr_update_pedidos_linea]    Script Date: 17/12/2024 15:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [NIDUX].[tgr_update_pedidos_linea]
ON [NIDUX].[PEDIDOS_LINEA]
AFTER UPDATE AS
  UPDATE PE
	SET RECORDDATE = GETDATE()
	FROM NIDUX.PEDIDOS_LINEA AS PE
	INNER JOIN inserted i ON i.ORDERID = PE.ORDERID
GO
ALTER TABLE [NIDUX].[PEDIDOS_LINEA] ENABLE TRIGGER [tgr_update_pedidos_linea]
GO
