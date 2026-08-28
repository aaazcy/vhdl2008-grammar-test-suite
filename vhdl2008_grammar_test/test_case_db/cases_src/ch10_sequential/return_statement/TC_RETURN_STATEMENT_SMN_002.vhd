-- =============================================================
-- Case ID: TC_RETURN_STATEMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_018
-- Standard Reference: IEEE 1076-2008 Section 10.13
-- Rule Description: RETURN in procedure must NOT have expression — negative variant
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: return in a procedure carrying a bit literal, a procedure cannot have any return value expression
-- Expected Result: Triggers semantic error: return with expression not allowed in procedure
-- Dependencies: None
-- =============================================================
entity return_proc_bit_ent is
  port (en : in bit; done : out bit);
end entity return_proc_bit_ent;

architecture smn of return_proc_bit_ent is
  procedure set_flag(signal f : out bit) is
  begin
    return '1';  -- ERROR: procedure cannot have return expression
    f <= '0';
  end procedure;
begin
  process(en) is
  begin
    set_flag(done);
    done <= en;
  end process;
end architecture smn;
