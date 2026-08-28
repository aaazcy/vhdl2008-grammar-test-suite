-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_PART_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_part ::= { package_body_declarative_item }
-- Case Type: Positive
-- Test Focus: package_body_declarative_part: five items mixed (type, subtype, constant, function body, procedure body) — exercises a rich, realistic mix of multiple declarative_item alternatives
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pbdp_five_mixed is
  port (
    clk     : in  bit;
    n_rst   : in  bit;
    q       : out natural;
    running : out boolean
  );
end entity;

architecture test of pbdp_five_mixed is
  -- Item 1: type_declaration
  type counter_range_t is range 0 to 1023;
  -- Item 2: subtype_declaration
  subtype cnt_t is natural range 0 to 1023;
  -- Item 3: constant_declaration
  constant C_MAX_COUNT : cnt_t := 1000;
  -- Item 4: function body
  function f_is_max(c : cnt_t) return boolean is
  begin
    return c >= C_MAX_COUNT;
  end function;
  -- Item 5: procedure body
  procedure p_reset_cnt(signal c : inout cnt_t) is
  begin
    c <= 0;
  end procedure;

  signal s_cnt : cnt_t := 0;
begin
  process(clk, n_rst) is
  begin
    if n_rst = '0' then
      p_reset_cnt(s_cnt);
    elsif clk'event and clk = '1' then
      if f_is_max(s_cnt) then
        p_reset_cnt(s_cnt);
      else
        s_cnt <= s_cnt + 1;
      end if;
    end if;
  end process;
  q       <= natural(s_cnt);
  running <= not f_is_max(s_cnt);
end architecture test;
