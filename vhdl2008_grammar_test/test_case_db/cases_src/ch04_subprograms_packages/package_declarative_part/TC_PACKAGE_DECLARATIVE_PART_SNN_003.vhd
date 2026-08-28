-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_PART_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_part ::= { package_declarative_item }
-- Case Type: Negative
-- Test Focus: package_declarative_part: ill-formed subprogram_instantiation_declaration — 'procedure my_proc is ;' is missing the 'new' keyword and the uninstantiated_subprogram_name, leaving a bare ';' after 'is' which the parser rejects as a lone semicolon
-- Expected Result: Triggers syntax error: ';' (semi colon) not allowed alone
-- Dependencies: None
-- =============================================================
package pdp_inst_pkg is
  procedure my_proc is ;
end package pdp_inst_pkg;
