-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_ITEM_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_PROCESS_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Rule Description: A signal cannot be declared within a process declarative part; signals must be declared in architecture or block declarative regions
-- Case Type: Negative
-- Error Category: scope_error
-- Test Focus: SMN: signal declared inside a process——`signal s_err : bit;` declares a signal in the process declarative part, which is illegal, verifying that a process declarative part allows variables but not signals
-- Expected Result: Triggers semantic error: signal declaration not allowed in process
-- Dependencies: None
-- =============================================================
entity pdi_smn2_ent is
  port(clk : in bit; q : out bit);
end entity pdi_smn2_ent;
architecture bh of pdi_smn2_ent is
begin
  process(clk) is
    signal s_err : bit;
  begin
    if clk'event and clk = '1' then
      s_err <= not s_err;
      q <= s_err;
    end if;
  end process;
end architecture bh;
