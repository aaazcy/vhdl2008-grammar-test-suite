-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Production: procedure_call_statement ::= [ label : ] procedure_call ;
-- Case Type: Positive
-- Test Focus: minimal form without label: `proc_name(args);` — an unlabeled procedure_call as a complete statement, verifying the minimal syntactic form of procedure_call_statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_stmt_min_ent is
  port (clk : in bit; cnt : out integer range 0 to 7);
end entity proc_stmt_min_ent;

architecture rtl of proc_stmt_min_ent is
  signal s_count : integer range 0 to 7 := 0;
  procedure increment(signal val : inout integer range 0 to 7) is
  begin
    if val < 7 then val <= val + 1; else val <= 0; end if;
  end procedure;
begin
  process(clk) is
  begin
    if clk'event and clk = '1' then
      increment(s_count);  -- unlabeled procedure call statement
    end if;
  end process;
  cnt <= s_count;
end architecture rtl;
