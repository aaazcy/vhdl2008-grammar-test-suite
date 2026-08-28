-- =============================================================
-- Case ID: TC_NULL_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_NULL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.14
-- Production: null_statement ::= [ label : ] null ;
-- Case Type: Positive
-- Test Focus: multiple null in an if-elsif chain: different conditional branches use multiple null placeholders, verifying the reusability of null in complex control flow
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity null_if_chain_ent is
  port (
    priority : in  integer range 0 to 3;
    grant_id : out integer range 0 to 3
  );
end entity null_if_chain_ent;

architecture arbiter of null_if_chain_ent is
  signal s_req : bit_vector(3 downto 0) := "0000";
begin
  process(priority) is
  begin
    if s_req(0) = '1' then
      grant_id <= 0;
    elsif s_req(1) = '1' then
      null;  -- priority path not taken
    elsif s_req(2) = '1' then
      null;  -- priority path not taken
    elsif s_req(3) = '1' then
      grant_id <= 3;
    else
      grant_id <= priority;  -- default
    end if;
  end process;
end architecture arbiter;
