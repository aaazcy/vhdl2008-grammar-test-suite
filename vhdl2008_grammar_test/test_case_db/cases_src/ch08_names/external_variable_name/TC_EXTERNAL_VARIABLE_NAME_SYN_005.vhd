-- =============================================================
-- Case ID: TC_EXTERNAL_VARIABLE_NAME_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_VARIABLE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_variable_name ::= << variable external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: External variable name accessing a variable deep in the hierarchy — alias deep_var is <<variable .tb.soc.cpu.alu.acc_val : bit_vector(31 downto 0)>> accesses the ALU accumulator variable deeply through a multi-level absolute path, verifying the use of a complex subtype in external_variable_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_var_deep_acc is
  port(capture : in bit; latched : out bit_vector(31 downto 0));
end entity;

architecture vhdl2008 of ext_var_deep_acc is
  alias deep_var is <<variable .tb_top.soc.cpu.alu.acc_val : bit_vector(31 downto 0)>>;
  signal latch : bit_vector(31 downto 0) := (others => '0');
begin
  process(capture)
  begin
    if rising_edge(capture) then latch <= deep_var; end if;
  end process;
  latched <= latch;
end architecture vhdl2008;
