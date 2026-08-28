-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_PART_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_declarative_part ::= { process_declarative_item }
-- Case Type: Positive
-- Test Focus: Minimal empty declarative part——the process has no declarations and goes directly to begin, verifying that a process_declarative_part can be empty (zero declarative items)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pdp_empty_ent is
  port(clk, d : in bit; q : out bit);
end entity pdp_empty_ent;
architecture bh of pdp_empty_ent is
begin
  process(clk) is
  begin
    if clk'event and clk = '1' then
      q <= d;
    end if;
  end process;
end architecture bh;
