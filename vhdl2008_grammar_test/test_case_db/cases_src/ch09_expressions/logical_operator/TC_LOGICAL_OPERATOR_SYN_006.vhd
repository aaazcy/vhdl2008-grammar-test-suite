-- =============================================================
-- Case ID: TC_LOGICAL_OPERATOR_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_operator ::= and | or | nand | nor | xor | xnor
-- Case Type: Positive
-- Test Focus: logical_operator combined with and/or in condition evaluation — an if condition uses multiple levels of and and or to form a complex combinational logic condition (3-way arbitration priority), verifying the multi-operator chained use of logical_operator in a condition expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_logic_in_cond is
  port (
    req_high   : in  bit;
    req_med    : in  bit;
    req_low    : in  bit;
    busy_high  : in  bit;
    busy_med   : in  bit;
    grant_high : out bit;
    grant_med  : out bit;
    grant_low  : out bit
  );
end entity ent_logic_in_cond;

architecture rtl of ent_logic_in_cond is
begin
  process(req_high, req_med, req_low, busy_high, busy_med)
  begin
    grant_high <= '0'; grant_med <= '0'; grant_low <= '0';
    if req_high = '1' and busy_high = '0' then
      grant_high <= '1';
    elsif req_med = '1' and busy_med = '0' and req_high = '0' then
      grant_med <= '1';
    elsif req_low = '1' and (busy_high or busy_med) = '0' then
      grant_low <= '1';
    end if;
  end process;
end architecture rtl;
