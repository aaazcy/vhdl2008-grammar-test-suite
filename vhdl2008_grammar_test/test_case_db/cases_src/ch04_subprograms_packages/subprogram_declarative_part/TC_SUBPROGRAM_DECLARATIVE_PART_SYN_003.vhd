-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_PART_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_declarative_part ::= { subprogram_declarative_item }
-- Case Type: Positive
-- Test Focus: subprogram_declarative_part: empty declarative part — exercises the zero-item case where the subprogram body has no declarative items at all (only the statement part)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdp_empty is
  port (
    clk  : in  bit;
    q    : out bit
  );
end entity;

architecture test of sdp_empty is
  -- Subprogram with empty declarative part — no subprogram_declarative_items
  function f_toggle(b : bit) return bit is
  begin
    return not b;
  end function;

  signal s_q : bit := '0';
begin
  process(clk) is
  begin
    if clk'event and clk = '1' then
      s_q <= f_toggle(s_q);
    end if;
  end process;
  q <= s_q;
end architecture test;
