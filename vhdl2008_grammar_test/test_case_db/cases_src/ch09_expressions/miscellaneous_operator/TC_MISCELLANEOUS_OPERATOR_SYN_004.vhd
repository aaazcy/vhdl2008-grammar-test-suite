-- =============================================================
-- Case ID: TC_MISCELLANEOUS_OPERATOR_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_MISCELLANEOUS_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: miscellaneous_operator ::= ** | abs | not
-- Case Type: Positive
-- Test Focus: the not operator negates a boolean condition — not used in an if statement to flip the logical condition, verifying the syntax of not applied to a boolean expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_not_bool is
  port (
    ready_i : in  boolean;
    busy_i  : in  boolean;
    go_o    : out boolean
  );
end entity ent_not_bool;

architecture rtl of ent_not_bool is
begin
  process(ready_i, busy_i)
  begin
    if not busy_i and ready_i then
      go_o <= true;
    else
      go_o <= false;
    end if;
  end process;
end architecture rtl;
