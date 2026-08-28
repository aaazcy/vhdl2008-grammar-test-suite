-- =============================================================
-- Case ID: TC_PATHNAME_ELEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PATHNAME_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: pathname_element ::= entity_simple_name | component_instantiation_label
-- Case Type: Positive
-- Test Focus: pathname_element as component_instantiation_label — a component instantiation label used as a pathname element; u_cpu, u_alu are instantiation labels serving as pathname elements
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pe_inst_label_ent is
  port(monitor_val : in bit_vector(7 downto 0); alert : out bit);
end entity;

architecture vhdl2008 of pe_inst_label_ent is
  alias alu_out is <<signal .tb_top.u_cpu.u_alu.result : bit_vector(7 downto 0)>>;
  signal alert_reg : bit := '0';
begin
  process(monitor_val)
  begin
    if monitor_val /= alu_out then
      alert_reg <= '1';
    else
      alert_reg <= '0';
    end if;
  end process;
  alert <= alert_reg;
end architecture vhdl2008;
