-- =============================================================
-- Case ID: TC_GROUP_TEMPLATE_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_TEMPLATE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_template_declaration ::= group identifier is ( entity_class_entry_list ) ;
-- Case Type: Positive
-- Test Focus: group_template_declaration: template with variable <> and file <> entity class entries
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gtd_variable_file_tmpl_syn is
  port (
    status_out : out integer;
    ready_out  : out bit
  );
end entity gtd_variable_file_tmpl_syn;

architecture focused of gtd_variable_file_tmpl_syn is
  group proc_resources is (variable, file <>);
  signal s_status : integer := 0;
  signal s_ready  : bit    := '1';
begin
  -- Note: file declarations are not synthesizable in all tools,
  -- but the template declaration itself is pure syntax and should compile.
  process
    variable v_counter : integer := 0;
  begin
    v_counter := v_counter + 1;
    s_status  <= v_counter;
    s_ready   <= '0' after 2 ns, '1' after 5 ns;
    wait for 10 ns;
  end process;
  status_out <= s_status;
  ready_out  <= s_ready;
end architecture focused;
