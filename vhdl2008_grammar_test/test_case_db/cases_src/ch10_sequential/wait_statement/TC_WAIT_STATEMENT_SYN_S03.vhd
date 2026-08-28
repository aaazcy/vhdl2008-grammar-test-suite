-- =============================================================
-- Case ID: TC_WAIT_STATEMENT_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: wait_statement ::= [ label : ] wait [ sensitivity_clause ] [ condition_clause ] [ timeout_clause ] ;
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific: wait until in a pipeline — a multi-stage pipeline uses wait until for stage synchronization, verifying the practical use of wait in structured designs
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wait_pipeline_ent is
  port (
    clk      : in  bit;
    data_in  : in  integer range 0 to 255;
    data_out : out integer range 0 to 255
  );
end entity wait_pipeline_ent;

architecture pipeline of wait_pipeline_ent is
  signal s_stage1 : integer range 0 to 255 := 0;
  signal s_stage2 : integer range 0 to 255 := 0;
begin
  stage1: process is
  begin
    wait until clk = '1';
    s_stage1 <= data_in;
  end process stage1;

  stage2: process is
  begin
    wait until clk = '1';
    s_stage2 <= s_stage1 * 2;
  end process stage2;

  stage3: process is
  begin
    wait until clk = '1';
    data_out <= s_stage2 + 1;
  end process stage3;
end architecture pipeline;
