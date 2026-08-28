-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Production: procedure_call_statement ::= [ label : ] procedure_call ;
-- Case Type: Positive
-- Test Focus: multiple procedure_call statements executed in sequence: two labeled procedure calls used consecutively in a process, verifying that multiple procedure_call_statements can coexist
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_stmt_multi_ent is
  port (
    a : in  integer range 0 to 255;
    b : in  integer range 0 to 255;
    s : out integer range 0 to 510
  );
end entity proc_stmt_multi_ent;

architecture sequential of proc_stmt_multi_ent is
  signal s_temp : integer range 0 to 510 := 0;
  signal s_final : integer range 0 to 510 := 0;

  procedure load_val(signal dest : out integer range 0 to 510;
                     val : in integer range 0 to 255) is
  begin
    dest <= val;
  end procedure;

  procedure add_to(signal dest : inout integer range 0 to 510;
                   inc : in integer range 0 to 255) is
  begin
    dest <= dest + inc;
  end procedure;
begin
  process(a, b) is
  begin
    load_a: load_val(s_temp, a);
    add_b: add_to(s_temp, b);
    s_final <= s_temp;
  end process;
  s <= s_final;
end architecture sequential;
