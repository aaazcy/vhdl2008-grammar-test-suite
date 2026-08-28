-- =============================================================
-- Case ID: TC_ASSERTION_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion_statement ::= [ label : ] assert condition [ report expression ] [ severity expression ] ;
-- Case Type: Positive
-- Test Focus: No label with report/severity: `assert condition report expr severity level ;` without label but with all optional clauses
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity assert_stmt_nolabel_ent is
  port (data : in bit_vector(7 downto 0); sum : out integer);
end entity assert_stmt_nolabel_ent;

architecture validate of assert_stmt_nolabel_ent is
  function count_ones(v : bit_vector) return integer is
    variable cnt : integer := 0;
  begin
    for i in v'range loop
      if v(i) = '1' then cnt := cnt + 1; end if;
    end loop;
    return cnt;
  end function;
begin
  process(data) is
  begin
    assert data'length = 8
      report "Data width mismatch: expected 8, got " & integer'image(data'length)
      severity error;
    sum <= count_ones(data);
  end process;
end architecture validate;
