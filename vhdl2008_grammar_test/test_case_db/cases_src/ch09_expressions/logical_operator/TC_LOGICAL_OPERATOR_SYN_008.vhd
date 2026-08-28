-- =============================================================
-- Case ID: TC_LOGICAL_OPERATOR_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_operator ::= and | or | nand | nor | xor | xnor
-- Case Type: Positive
-- Test Focus: all six logical_operators used on boolean type for condition evaluation — in a case? statement, boolean conditions combined with and/or/xor/nand/nor/xnor select the data channel, verifying the complete syntax coverage of the six operators in complex multiplexing
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_all_six_bool is
  port (
    a_i, b_i : in  boolean;
    x_i, y_i : in  boolean;
    z_i      : in  boolean;
    d0_i     : in  integer;
    d1_i     : in  integer;
    d2_i     : in  integer;
    d3_i     : in  integer;
    d4_i     : in  integer;
    d5_i     : in  integer;
    sel_o    : out integer
  );
end entity ent_all_six_bool;

architecture rtl of ent_all_six_bool is
  signal sel : integer range 0 to 7 := 0;
begin
  process(a_i, b_i, x_i, y_i, z_i, d0_i, d1_i, d2_i, d3_i, d4_i, d5_i)
  begin
    if a_i and b_i then
      sel_o <= d0_i;
    elsif a_i or b_i then
      sel_o <= d1_i;
    elsif x_i xor y_i then
      sel_o <= d2_i;
    elsif x_i nand y_i then
      sel_o <= d3_i;
    elsif a_i nor z_i then
      sel_o <= d4_i;
    elsif x_i xnor y_i then
      sel_o <= d5_i;
    else
      sel_o <= 0;
    end if;
  end process;
end architecture rtl;
