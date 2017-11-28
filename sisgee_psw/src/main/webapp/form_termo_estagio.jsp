<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="import_head.jspf"%>

<style type="text/css">

div.container {
	margin-bottom: 2em;
}
form {
	margin-top: 50px;
}
fieldset.form-group {
	 border:1px solid #999999;
}
fieldset legend.col-form-legend {
	font-weight: bold;
}
div.form-row {
	padding: 0px 15px;
}

</style>

<title>
	<c:choose>
		<c:when test="${ not empty aditivo }">
			Registro de Termo Aditivo
		</c:when>
		<c:otherwise>
			Registro de Termo de Est�gio
		</c:otherwise>
	</c:choose>
</title>
</head>
<body>
	<%@include file="import_navbar.jspf"%>
	
	<div class="container">
		<c:if test="${ not empty msg }">
			<div class="alert alert-warning" role="alert">
				${ msg }
			</div>
		</c:if>

		<p class="tituloForm">

		<h5>		
		<c:choose>
			<c:when test="${ not empty aditivo }">
				Registro de Termo Aditivo
			</c:when>
			<c:otherwise>
				Registro de Termo de Est�gio
			</c:otherwise>
		</c:choose>
		</h5>		
		</p>		
		
		<c:choose>
			<c:when test="${ not empty aditivo }">
				<form action="ValidaTermoAditivoServlet" method="post">
			</c:when>
			<c:otherwise>
				<form action="FormTermoEstagioServlet" method="post">
			</c:otherwise>
		</c:choose>
		
			<fieldset class="form-group" ${ not empty aditivo ? 'disabled' :'' }>
				<legend class="col-form-legend col-lg">Dados da Empresa Conveniada</legend>
				<div class="form-group col-md-6">
					<label for="numeroConvenio">N�mero do conv�nio</label>
					<input type="hidden" id="idEmpresa" name="idEmpresa" value="${ param.idEmpresa }">
					<input type="text" class="form-control ${ not empty convenioMsg ? 'is-invalid': 'is-valid' }" id="numeroConvenio" name="numeroConvenio" value="${ param.numeroConvenio }" >
					<c:if test="${ not empty numeroConvenioMsg }">
				    	<div class="invalid-feedback">${ numeroConvenioMsg }</div>
		        	</c:if>
				</div>

				<div class="form-row">
					<div class="form-group col-md-3">
						<label for="isAgenteIntegracao">� Agente de Integra��o?</label>
					</div>
					
					<div class="custom-controls-stacked d-block my-3">							
						  <label class="custom-control custom-radio">
						    <input id="agenteSim" class="custom-control-input isAgenteChk" type="radio" name="isAgenteIntegracao" required value="sim"> 
								<span class="custom-control-indicator"></span> 
								<span class="custom-control-description" >Sim</span>
						  </label>						
						
						  <label class="custom-control custom-radio">
						    <input id="agenteNao" class="custom-control-input isAgenteChk" type="radio" name="isAgenteIntegracao" required value="nao"> 
								<span class="custom-control-indicator"></span> 
								<span class="custom-control-description">N�o</span>
						  </label>
					</div>
				</div>							
				
				<div class="form-row notAI AI">
					<div class="form-group col-md-4">
						<label for="cnpjEmpresa">CNPJ</label>
						<div class="input-group">						  
					      <input type="text" class="form-control cnpjEmpresaNotAI cnpjEmpresa" placeholder="Digite o CNPJ" id="cnpjEmpresa" name="cnpjEmpresa" value="${ param.cnpjEmpresa }">
					      <span class="input-group-btn">
					        <button class="btn btn-primary" type="button" id="btnBuscarEmpresaNotAI">Buscar</button>
					      </span>
					    </div>
					</div>
					<div class="form-group col-md-6">
						<label for="nomeEmpresa">Raz�o Social</label>
						<input type="text" class="form-control nomeEmpresaNotAI nomeEmpresa" id="nomeEmpresa" name="nomeEmpresa" value="${ param.nomeEmpresa }" readonly>
					</div>
					<div class="form-group col-md-2" style="padding-top: 1.9em">
						<button type="button" class="btn btn-primary addEmpresa">+</button>
					</div>
				</div>
				
				<div class="form-row isAI AI">
					<div class="form-group col-md-6">
						<label for="idAgenteIntegracao">Raz�o Social</label>
						<select id="idAgenteIntegracao" name="idAgenteIntegracao" class="form-control">
							<option value="" selected>---</option>
							<c:forEach items="${ agentesIntegracao }" var="agenteIntegracao">
								<option value="${ agenteIntegracao.idAgenteIntegracao }">${ agenteIntegracao.nomeAgenteIntegracao }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group col-md-2" style="padding-top: 1.9em">
						<button type="button" class="btn btn-primary addAgenteIntegracao">+</button>
					</div>
				</div>
				<div class="form-row isAI AI">
					<div class="form-group col-md-5">
						<label for="cnpjEmpresa">CNPJ da Empresa ligada ao Agente de Integra��o</label>
						<div class="input-group">
					      <input type="text" class="form-control cnpjEmpresaIsAI cnpjEmpresa" placeholder="Digite o CNPJ" name="cnpjEmpresa" value="${ param.cnpjEmpresa }">
					      <span class="input-group-btn">
					        <button class="btn btn-primary" type="button" id="btnBuscarEmpresaIsAI">Buscar</button>
					      </span>
					    </div>
					</div>
					<div class="form-group col-md-5">
						<label for="nomeEmpresa">Raz�o social da Empresa ligada ao Agente de Integra��o</label>
						<input type="text" class="form-control nomeEmpresaIsAI nomeEmpresa" name="nomeEmpresa" value="${ param.nomeEmpresa }" readonly>
					</div>
					<div class="form-group col-md-2" style="padding-top: 1.9em">
						<button type="button" class="btn btn-primary addEmpresa">+</button>
					</div>
				</div>							
			</fieldset>
			
			
			<fieldset class="form-group dadosAluno" ${ not empty aditivo ? 'disabled' :'' }>
			<%@include file="import_busca_aluno.jspf"%>
			</fieldset>


			<c:if test="${ not empty periodoMsg }">
				<div class="alert alert-danger" role="alert">${ periodoMsg }</div>
			</c:if>
			<fieldset class="form-group">
				<legend class="col-form-legend col-lg">Vig�ncia do Est�gio</legend>
				<div class="form-row">
					<div class="form-group col-md-4">

						<label for="dataInicioTermoEstagio">Data de in�cio</label>
						<input type="text" class="form-control ${ not empty dataInicioMsg ? 'is-invalid': not empty periodoMsg ? 'is-invalid' : 'is-valid' }" id="dataInicioTermoEstagio"  name="dataInicioTermoEstagio" value="${ param.dataInicioTermoEstagio }" >
					<c:if test="${ not empty dataInicioMsg }">
				    	<div class="invalid-feedback">${ dataInicioMsg }</div>
		        	</c:if>
					</div>
					<div class="form-group col-md-4">
						<label for="dataFimTermoEstagio">Data de t�rmino</label>
						<input type="text" class="form-control ${ not empty dataFimMsg ? 'is-invalid': not empty periodoMsg ? 'is-invalid' : 'is-valid' }" id="dataFimTermoEstagio"   name="dataFimTermoEstagio" value="${ param.dataFimTermoEstagio }" >
						<c:if test="${ not empty dataFimMsg }">
				    		<div class="invalid-feedback">${ dataFimMsg }</div>
		        	</c:if>
					</div>
				</div>
			</fieldset>
			
			
			<fieldset class="form-group">
				<legend class="col-form-legend col-lg">Carga Hor�ria do Aluno</legend>
				<div class="form-row">
					<div class="form-group col-md-4">
						<label for="cargaHorariaTermoEstagio">Horas por dia</label>
						<input type="text" class="form-control ${ not empty cargaHorariaMsg ? 'is-invalid': 'is-valid' }" id="cargaHorariaTermoEstagio" name="cargaHorariaTermoEstagio" value="${ param.cargaHorariaTermoEstagio }" >
						<c:if test="${ not empty cargaHorariaMsg }">
				    		<div class="invalid-feedback">${ cargaHorariaMsg }</div>
		        		</c:if>
					</div>
				</div>
			</fieldset>
			
			
			<fieldset class="form-group">
				<legend class="col-form-legend col-lg">Valor da Bolsa de Est�gio</legend>
				<div class="form-row">
					<div class="form-group col-md-4">
						<label for="valorBolsa">Valor</label>
						<input type="text" class="form-control ${ not empty valorBolsaMsg ? 'is-invalid': 'is-valid' }" id="valorBolsa" name="valorBolsa" value="${ param.valorBolsa }" >
						<c:if test="${ not empty valorBolsaMsg }">
				    		<div class="invalid-feedback">${ valorBolsaMsg }</div>
		        		</c:if>
					</div>
				</div>
			</fieldset>
			
			
			<fieldset class="form-group">
				<legend class="col-form-legend col-lg">Local do Est�gio</legend>
				<div class="form-row">
					<div class="form-group col-md-12">

						<label for="enderecoTermoEstagio">Endere�o</label>
						<input type="text" class="form-control ${ not empty enderecoMsg ? 'is-invalid': not empty enderecoMsg ? 'is-invalid' : 'is-valid' }" id="enderecoTermoEstagio" name="enderecoTermoEstagio" value="${ param.enderecoTermoEstagio }">
						<c:if test="${ not empty enderecoMsg }">
				    		<div class="invalid-feedback">${ enderecoMsg }</div>
		        		</c:if>
					</div>
					</div>
					<div class="form-row">
					<div class="form-group col-md-2">
						<label for="numeroEnderecoTermoEstagio">N�mero</label>
						<input type="text" class="form-control ${ not empty numeroEnderecoMsg ? 'is-invalid': not empty numeroEnderecoMsg ? 'is-invalid' : 'is-valid' }" id="numeroEnderecoTermoEstagio" name="numeroEnderecoTermoEstagio" value="${ param.numeroEnderecoTermoEstagio }">
						<c:if test="${ not empty numeroEnderecoMsg }">
				    		<div class="invalid-feedback">${ numeroEnderecoMsg }</div>
		        		</c:if>
					</div>
					<div class="form-group col-md-4">
						<label for="complementoEnderecoTermoEstagio">Complemento</label>
						<input type="text" class="form-control ${ not empty complementoEnderecoMsg ? 'is-invalid': not empty complementoEnderecoMsg ? 'is-invalid' : 'is-valid' }" id="complementoEnderecoTermoEstagio" name="complementoEnderecoTermoEstagio" value="${ param.complementoEnderecoTermoEstagio }">
						<c:if test="${ not empty complementoEnderecoMsg }">
				    		<div class="invalid-feedback">${ complementoEnderecoMsg }</div>
		        		</c:if>
					</div>
					<div class="form-group col-md-6">
						<label for="bairroEnderecoTermoEstagio">Bairro</label>
						<input type="text" class="form-control ${ not empty bairroEnderecoMsg ? 'is-invalid': not empty bairroEnderecoMsg ? 'is-invalid' : 'is-valid' }" id="bairroEnderecoTermoEstagio" name="bairroEnderecoTermoEstagio" value="${ param.bairroEnderecoTermoEstagio }">
						<c:if test="${ not empty bairroEnderecoMsg }">
				    		<div class="invalid-feedback">${ bairroEnderecoMsg }</div>
		        		</c:if>
					</div>
				</div>
				<div class="form-row">					
					<div class="form-group col-md-6">
						<label for="cidadeEnderecoTermoEstagio">Cidade</label>
						<input type="text" class="form-control ${ not empty cidadeEnderecoMsg ? 'is-invalid': not empty cidadeEnderecoMsg ? 'is-invalid' : 'is-valid' }" id="cidadeEnderecoTermoEstagio" name="cidadeEnderecoTermoEstagio" value="${ param.cidadeEnderecoTermoEstagio }">
						<c:if test="${ not empty cidadeEnderecoMsg }">
				    		<div class="invalid-feedback">${ cidadeEnderecoMsg }</div>
		        		</c:if>
					</div>
					<div class="form-group col-md-2">
						<label for="estadoEnderecoTermoEstagio">Estado</label>
						<select name = "estadoEnderecoTermoEstagio" id="estadoEnderecoTermoEstagio" class="form-control ${ not empty estadoEnderecoMsg ? 'is-invalid': not empty estadoEnderecoMsg ? 'is-invalid' : 'is-valid' }">
							<option value="" selected>---</option>
							<c:forEach items="${ uf }" var="uf">
								<option value="${ uf }">${ uf }</option>
							</c:forEach>							
						</select>
						<c:if test="${ not empty estadoEnderecoMsg }">
				    		<div class="invalid-feedback">${ estadoEnderecoMsg }</div>
		        		</c:if>
					</div>
					<div class="form-group col-md-4">
						<label for="cepEnderecoTermoEstagio">CEP</label>
						<input type="text" class="form-control ${ not empty cepEnderecoMsg ? 'is-invalid': not empty cepEnderecoMsg ? 'is-invalid' : 'is-valid' }" id="cepEnderecoTermoEstagio" name="cepEnderecoTermoEstagio" value="${ param.cepEnderecoTermoEstagio }">
						<c:if test="${ not empty cepEnderecoMsg }">
				    		<div class="invalid-feedback">${ cepEnderecoMsg }</div>
		        		</c:if>
					</div>
				</div>
			</fieldset>

		
			<div class="form-row" >
				<div class="form-group col-md-3" >
					<label for="eEstagioObrigatorio">O est�gio � obrigat�rio?</label>
				</div>

				<div class="custom-controls-stacked d-block my-3">
					<label class="custom-control custom-radio"> 
						<input id="estagioSim" name="eEstagioObrigatorio" type="radio" class="custom-control-input" required value = "sim" ${ not empty aditivo ? 'disabled' :'' }> 
						<span class="custom-control-indicator"></span> 
						<span class="custom-control-description" >Sim</span>
					</label> 
					<label class="custom-control custom-radio"> 
						<input id="estagioNao" name="eEstagioObrigatorio" type="radio" class="custom-control-input" required value = "nao" ${ not empty aditivo ? 'disabled' :'' }> 
						<span class="custom-control-indicator"></span> 
						<span class="custom-control-description">N�o</span>
					</label>
				</div>				
			</div>
			
			
			<div class="form-group col-md-8">
				<label for="idProfessorOrientador">Professor orientador</label>
				<select name="idProfessorOrientador" id="idProfessorOrientador" class="form-control ${ not empty idProfessorMsg ? 'is-invalid': not empty idProfessorMsg ? 'is-invalid' : 'is-valid' }">
					<option value="" selected>---</option>
					<c:forEach items="${ professores }" var="professor">
						<option value="${ professor.idProfessorOrientador }">${ professor.nomeProfessorOrientador }</option>
					</c:forEach>					
				</select>
				<c:if test="${ not empty idProfessorMsg }">
				    		<div class="invalid-feedback">${ idProfessorMsg }</div>
		        		</c:if>				
			</div>
			
			
			
			<button type="submit" class="btn btn-primary">Salvar</button>
			<button type="button" class="btn btn-secondary">Cancelar</button>
			
		</form>
		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="myModalLabel"></h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body"></div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
		      </div>
		    </div>
		  </div>
		</div>

	</div>
	<%@include file="import_footer.jspf"%>
	<%@include file="import_finalbodyscripts.jspf"%>
   	<%@include file="import_scripts.jspf"%>
</body>
</html>
