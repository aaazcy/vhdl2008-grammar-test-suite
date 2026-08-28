-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Negative
-- Test Focus: SNN: Generic missing semicolon separator — `generic(A:integer:=1 B:boolean:=true)`, no `;` separator between the two interface_constant_declarations, verifying multiple generic declarations in a generic_list must be separated by semicolons
-- Expected Result: Triggers syntax error: missing ";" in generic list
-- Dependencies: None
-- =============================================================
entity bad_gen_sep is
  generic(A:integer:=1 B:boolean:=true);
  port(x:in bit);
end entity bad_gen_sep;
