-- =============================================================
-- Case ID: TC_CONSTANT_DECLARATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTANT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.1
-- Production: constant_declaration ::= constant identifier_list : subtype_indication [ := expression ] ;
-- Case Type: Negative
-- Test Focus: ERROR: constant without initializer in architecture body (deferred constants only allowed in packages).
-- Expected Result: Triggers syntax error (missing initializer in architecture)
-- Dependencies: None
-- =============================================================
entity constant_decl_snn4 is
end entity constant_decl_snn4;

architecture arch of constant_decl_snn4 is
  constant C_DEFERRED : integer;
begin
end architecture arch;
