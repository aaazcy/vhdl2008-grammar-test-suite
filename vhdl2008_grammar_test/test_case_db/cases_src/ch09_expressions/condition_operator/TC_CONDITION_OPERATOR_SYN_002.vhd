-- =============================================================
-- Case ID: TC_CONDITION_OPERATOR_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: condition_operator ::= ??
-- Case Type: Positive
-- Test Focus: ?? applied to a bit type signal — ?? converts the bit value to boolean for use in a while loop condition, verifying the implicit conversion of condition_operator on the bit type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_co_bit is
  port (
    busy_i : in  bit;
    data_i : in  integer;
    cnt_o  : out integer
  );
end entity ent_co_bit;

architecture rtl of ent_co_bit is
begin
  process(busy_i, data_i)
  begin
    if ?? busy_i then
      cnt_o <= data_i;
    else
      cnt_o <= 0;
    end if;
  end process;
end architecture rtl;
