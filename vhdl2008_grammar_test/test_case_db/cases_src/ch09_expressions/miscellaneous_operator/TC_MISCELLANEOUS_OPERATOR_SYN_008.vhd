-- =============================================================
-- Case ID: TC_MISCELLANEOUS_OPERATOR_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_MISCELLANEOUS_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: miscellaneous_operator ::= ** | abs | not
-- Case Type: Positive
-- Test Focus: all three miscellaneous_operators combined in a process — not flips the enable, abs computes the absolute value of the difference, ** computes the squared threshold, verifying the complete syntax coverage of the three unary operators in the same design
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_all_three_misc is
  port (
    clk_i    : in  bit;
    data_a   : in  integer range 0 to 31;
    data_b   : in  integer range 0 to 31;
    en_i     : in  bit;
    valid_o  : out bit;
    dist_o   : out integer range 0 to 961
  );
end entity ent_all_three_misc;

architecture rtl of ent_all_three_misc is
begin
  process(clk_i)
  begin
    if clk_i'event and clk_i = '1' then
      valid_o <= not en_i;
      dist_o  <= abs(data_a - data_b) ** 2;
    end if;
  end process;
end architecture rtl;
