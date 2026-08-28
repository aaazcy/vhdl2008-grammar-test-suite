-- =============================================================
-- Case ID: TC_SELECTED_NAME_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Production: selected_name ::= prefix . suffix
-- Case Type: Positive
-- Test Focus: selected_name accessing a signal inside a block——b_label.inner_sig accesses the signal declared inside the block through the block label as prefix, verifying that a block label can serve as the prefix of a selected_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_name_block_acc is
  port(clk : in bit; val_out : out integer);
end entity;

architecture vhdl2008 of sel_name_block_acc is
  signal external : integer := 0;
begin
  b_inner : block
    signal inner_val : integer := 42;
  begin
    process(clk)
    begin
      if rising_edge(clk) then
        external <= b_inner.inner_val;
      end if;
    end process;
  end block;
  val_out <= external;
end architecture vhdl2008;
