-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DEFINITION_SMN_001
-- Related Rule ID: SMN_PROTECTE_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_definition ::= protected_type_declaration | protected_type_body
-- Test Focus: SEMANTIC NEGATIVE — a protected type body is declared for t_def without any preceding protected type declaration of t_def, so the body has no corresponding declaration
-- Case Type: Negative
-- Expected Result: Triggers semantic error: no protected type declaration for this body
-- =============================================================
entity pt36b_ent is
  port ( dout : out integer );
end entity pt36b_ent;
architecture rtl of pt36b_ent is
  type t_def is protected body
    variable v : integer := 0;
  end protected body;
begin
  dout <= 0;
end architecture rtl;
