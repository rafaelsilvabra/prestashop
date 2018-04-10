{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{capture name=path}{l s='Fale Conosco'}{/capture}
<h1 class="page-heading bottom-indent">
	{l s='Serviço ao cliente'} - {if isset($customerThread) && $customerThread}{l s='Sua resposta'}{else}{l s='Fale Conosco'}{/if}
</h1>
{if isset($confirmation)}
	<p class="alert alert-success">{l s='Sua mensagem foi enviada com sucesso.'}</p>
	<ul class="footer_links clearfix">
		<li>
			<a class="btn btn-default button button-small" href="{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}">
				<span>
					<i class="icon-chevron-left"></i>{l s='Home'}
				</span>
			</a>
		</li>
	</ul>
{elseif isset($alreadySent)}
	<p class="alert alert-warning">{l s='Sua mensagem já foi enviada.'}</p>
	<ul class="footer_links clearfix">
		<li>
			<a class="btn btn-default button button-small" href="{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}">
				<span>
					<i class="icon-chevron-left"></i>{l s='Home'}
				</span>
			</a>
		</li>
	</ul>
{else}
	{include file="$tpl_dir./errors.tpl"}
	<form class="contact-form-box" name="formulario" method="post" action="/envio-formulario.php">
	<input id="assunto_mensagem" value="Contato | Itacuã Loja Virtual" name="assunto_mensagem" type="hidden">
	 <fieldset>
	   <div class="clearfix">
	   	<p>&nbsp;</p>
		
		<div class="col-xs-12 col-md-4">
		 <div class="form-group">
		  <p class="form-group" style="padding-bottom: 10px;">
		  	<label for="nome">{l s='Nome'}</label>
		  	<input class="form-control" type="text" id="nome" name="nome" style="max-width: 100%;" required />
		  </p>
		 </div>

		 <div class="form-group">
		  <p class="form-group" style="padding-bottom: 10px;">
		  	<label for="email">{l s='E-mail'}</label>
		  	<input class="form-control" type="text" id="email" name="email" style="max-width: 100%;" required />
		  </p>
		 </div>

		 <div class="form-group">
		  <p class="form-group" style="padding-bottom: 10px;">
		  	<label for="telefone">{l s='Telefone'}</label>
		  	<input class="form-control" type="text" id="telefone" name="telefone" placeholder="(DDD) Número" style="max-width: 100%;" />
		  </p>
		 </div>

		 <div class="form-group">
		  <p class="form-group" style="padding-bottom: 10px;">
		  	<label for="celular">{l s='Celular/WhatsApp'}</label>
		  	<input class="form-control" type="text" id="celular" name="celular" placeholder="(DDD) Número" style="max-width: 100%;" />
		  </p>
		 </div>

		 <div class="form-group">
		  <p class="form-group" style="padding-bottom: 10px;">
		  	<label for="referencia">{l s='Ajuda com produto'}</label>
		  	<input class="form-control" type="text" id="referencia" name="referencia" placeholder="Código Referência" style="max-width: 100%;" />
		  </p>
		 </div>
		</div>
		
		<div class="col-xs-12 col-md-8">
		 <div class="form-group">
		  <label for="message">{l s='Mensagem'}</label>
		   <textarea class="form-control" id="msg" name="msg"></textarea>
		 </div>
		</div>

			<div class="submit" style="text-align: right;padding-right:15px;">
				<button type="submit" name="submitMessage" id="submitMessage" class="button btn btn-default button-medium"><span>{l s='Enviar Mensagem'}<i class="icon-chevron-right right"></i></span></button>
			</div>		
		</div>

		</fieldset>
	</form>
<script src="/js/jquery.maskedinput.min.js"></script>
<script type="text/javascript">
jQuery(function($){
   $("#telefone").mask("(99) 9999-9999");
   $("#celular").mask("(99) 9 9999-9999");
});
</script>

{/if}
{addJsDefL name='contact_fileDefaultHtml'}{l s='Nenhum arquivo selecionado' js=1}{/addJsDefL}
{addJsDefL name='contact_fileButtonHtml'}{l s='Selecione um arquivo' js=1}{/addJsDefL}
