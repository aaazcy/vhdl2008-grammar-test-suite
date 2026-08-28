-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Production: procedure_call_statement ::= [ label : ] procedure_call ;
-- Case Type: Positive
-- Test Focus: with label: `do_write: write_fifo(data);` — verifying that a procedure_call_statement may carry an optional label prefix
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_stmt_label_ent is
  port (
    wr_data : in  bit_vector(7 downto 0);
    wr_en   : in  bit
  );
end entity proc_stmt_label_ent;

architecture labeled of proc_stmt_label_ent is
  signal s_buf : bit_vector(7 downto 0) := (others => '0');
begin
  process(wr_data, wr_en) is
    procedure store_value(d : in bit_vector(7 downto 0)) is
    begin
      s_buf <= d;
    end procedure;
  begin
    if wr_en = '1' then
      save_data: store_value(wr_data);  -- labeled procedure call
    end if;
  end process;
end architecture labeled;
