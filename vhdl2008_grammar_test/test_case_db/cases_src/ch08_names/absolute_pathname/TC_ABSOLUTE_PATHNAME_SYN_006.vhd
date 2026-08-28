-- =============================================================
-- Case ID: TC_ABSOLUTE_PATHNAME_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSOLUTE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: absolute_pathname ::= . partial_pathname
-- Case Type: Positive
-- Test Focus: Absolute pathname used to access a variable — in the form <<variable .tb.uut.shared_var : bit_vector>>, the absolute_pathname starting with '.' points to a shared variable in the testbench hierarchy, suitable for cross-hierarchy variable monitoring
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity abs_path_var_acc is
  port(sample_en : in bit; var_val : out bit_vector(3 downto 0));
end entity;

architecture vhdl2008 of abs_path_var_acc is
  alias tracked_var is <<variable .tb_top.u_dut.status_reg : bit_vector(3 downto 0)>>;
  signal latch_val : bit_vector(3 downto 0) := (others => '0');
begin
  process(sample_en)
  begin
    if rising_edge(sample_en) then
      latch_val <= tracked_var;
    end if;
  end process;
  var_val <= latch_val;
end architecture vhdl2008;
