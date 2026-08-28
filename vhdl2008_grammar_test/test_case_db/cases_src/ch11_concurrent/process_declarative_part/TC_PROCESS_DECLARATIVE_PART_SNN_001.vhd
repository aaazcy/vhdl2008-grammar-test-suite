-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_PART_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_declarative_part ::= { process_declarative_item }
-- Case Type: Negative
-- Test Focus: SNN: declarations present but "begin" missing——a statement directly follows the process declarative part without the begin keyword, verifying that a process with a declarative part must use begin to separate declarations and statements
-- Expected Result: Triggers syntax error: missing "begin" after process declarative part
-- Dependencies: None
-- =============================================================
entity pdp_snn1_ent is
  port(clk, d : in bit; q : out bit);
end entity pdp_snn1_ent;
architecture bh of pdp_snn1_ent is
begin
  process(clk) is
    variable v : bit;
    if clk'event and clk = '1' then
      v := d; q <= v;
    end if;
  end process;
end architecture bh;
