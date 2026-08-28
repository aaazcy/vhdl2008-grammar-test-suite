-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_PART_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_declarative_part ::= { process_declarative_item }
-- Case Type: Positive
-- Test Focus: Single variable declaration——the process declarative part has only one variable, verifying the smallest non-empty declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pdp_one_ent is
  port(clk : in bit; inc : in integer; sum : out integer);
end entity pdp_one_ent;
architecture bh of pdp_one_ent is
begin
  process(clk) is
    variable v_total : integer := 0;
  begin
    if clk'event and clk = '1' then
      v_total := v_total + inc;
      sum <= v_total;
    end if;
  end process;
end architecture bh;
