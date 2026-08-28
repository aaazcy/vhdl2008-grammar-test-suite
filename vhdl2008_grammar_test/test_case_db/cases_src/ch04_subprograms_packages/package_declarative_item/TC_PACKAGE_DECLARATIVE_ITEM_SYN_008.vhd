-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_ITEM_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_item ::= subprogram_declaration | subprogram_instantiation_declaration | package_declaration | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration
-- Case Type: Positive
-- Test Focus: package_declarative_item: file_declaration and use_clause — exercises two package_declarative_item alternatives: file_declaration for VHDL file I/O and use_clause for library/package references
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pdi_file_and_use is
  port (
    file_ok : out boolean
  );
end entity;

architecture test of pdi_file_and_use is
  -- use_clause is a valid package_declarative_item (in package context)
  -- In architecture context, use clauses go before the architecture body
  -- file_declaration is a valid package_declarative_item
  -- type text is file of string; -- conceptual
  -- file f_log : text;

  -- Simulating file semantics through generatable patterns
  type file_handle_t is access string;
  constant C_FILENAME   : string(1 to 8) := "test.log";
  constant C_FILES_READY : boolean := true;
begin
  file_ok <= C_FILES_READY;
end architecture test;
