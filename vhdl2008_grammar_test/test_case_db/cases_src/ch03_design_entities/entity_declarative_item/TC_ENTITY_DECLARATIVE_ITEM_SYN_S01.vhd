-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Test Focus: Entity declarative items: subprogram, type, subtype, constant, signal, file, alias, attribute, component, use, shared variable, disconnect, group
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_entity_declarative_item_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_entity_declarative_item_syn_s01 is
  type t_edi is range 0 to 15; subtype t_edi_s is t_edi range 0 to 7;
  constant C_EDI:t_edi:=0; alias a_edi is C_EDI;
  type t_pt is protected
  end protected t_pt;
  type t_pt is protected body
  end protected body t_pt;
  shared variable sv_edi:t_pt;
  component comp_edi is port(x:in t_edi); end component;
  attribute edi_a:string; attribute edi_a of C_EDI:constant is "entity_decl_item";
begin
  r<=integer(C_EDI)+1;end architecture bh;
