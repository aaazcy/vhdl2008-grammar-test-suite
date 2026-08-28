-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | ... (22 alternatives)
-- Case Type: Negative
-- Test Focus: SNN: variable_declaration as entity_declarative_item — the entity declarative part contains variable v_temp:integer:=0 (without shared), variable_declaration is not among the 22 alternatives of entity_declarative_item, only shared_variable_declaration is allowed, verifying ordinary variable declarations are illegal in the entity declarative part
-- Expected Result: Triggers syntax error: variable declaration not allowed in entity declarative part
-- Dependencies: None
-- =============================================================
entity edi_snn4_ent is
  port(clk:in bit; y:out integer);
  variable v_temp:integer:=0;
end entity edi_snn4_ent;
architecture bh of edi_snn4_ent is
begin
  process(clk) begin
    if clk'event and clk='1' then y<=v_temp; end if;
  end process;
end architecture bh;
