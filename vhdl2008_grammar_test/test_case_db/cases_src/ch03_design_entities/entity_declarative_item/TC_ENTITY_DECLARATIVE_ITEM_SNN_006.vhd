-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_item ::= subprogram_declaration | subprogram_body | ... (22 alternatives)
-- Case Type: Negative
-- Test Focus: SNN: incomplete subprogram_body syntax — the function body in the entity declarative part lacks the is keyword, function f_bad(x:integer) return integer begin... missing is, verifying the subprogram_body BNF requires the is keyword between the parameter list and begin
-- Expected Result: Triggers syntax error: missing 'is' in subprogram body
-- Dependencies: None
-- =============================================================
entity edi_snn6_ent is
  port(a:in integer; y:out integer);
  function f_bad(x:integer) return integer begin return x*2; end function f_bad;
end entity edi_snn6_ent;
architecture bh of edi_snn6_ent is
begin y<=a; end architecture bh;
