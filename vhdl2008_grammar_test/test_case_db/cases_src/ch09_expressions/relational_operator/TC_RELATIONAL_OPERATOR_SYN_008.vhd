-- =============================================================
-- Case ID: TC_RELATIONAL_OPERATOR_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIONAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relational_operator ::= = | /= | < | <= | > | >= | ?= | ?/= | ?< | ?<= | ?> | ?>=
-- Case Type: Positive
-- Test Focus: the = operator used in the condition of an assert statement——assert makes an equality assertion on the counter value and raises a report, verifying the syntax of relational_operator in VHDL assertion conditions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_assert_cmp is
  port (
    clk   : in  bit;
    cnt_i : in  integer range 0 to 15
  );
end entity ent_assert_cmp;

architecture rtl of ent_assert_cmp is
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      assert cnt_i /= 15
        report "Counter overflow warning"
        severity warning;
    end if;
  end process;
end architecture rtl;
