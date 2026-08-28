-- =============================================================
-- Case ID: TC_NEXT_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_NEXT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.12
-- Production: next_statement ::= [ label : ] next [ loop_label ] [ when condition ] ;
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific: next in an ALU pipeline — in a multi-level for loop, next row skips invalid data rows, verifying that next skips the outer loop iteration in matrix processing
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity next_alu_pipe_ent is
  port (
    op_sel  : in  integer range 0 to 3;
    result  : out integer range 0 to 255
  );
end entity next_alu_pipe_ent;

architecture alu of next_alu_pipe_ent is
  type t_op_matrix is array (0 to 3, 0 to 3) of integer range 0 to 255;
  signal s_ops : t_op_matrix := (others => (others => 0));
begin
  process(op_sel) is
    variable v_acc : integer range 0 to 255 := 0;
  begin
    v_acc := 0;
    row_scan: for r in 0 to 3 loop
      next row_scan when r = 0;  -- skip row 0 (always zero)
      col_scan: for c in 0 to 3 loop
        if c = op_sel then
          v_acc := v_acc + s_ops(r, c);
          exit col_scan;
        end if;
      end loop col_scan;
    end loop row_scan;
    result <= v_acc;
  end process;
end architecture alu;
