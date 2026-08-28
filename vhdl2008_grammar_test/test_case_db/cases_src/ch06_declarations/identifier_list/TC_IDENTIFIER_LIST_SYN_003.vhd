-- =============================================================
-- Case ID: TC_IDENTIFIER_LIST_SYN_003
-- Rule Type: Syntax
-- BNF Production: IDENTIFIER_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.2
-- Production: identifier_list ::= identifier { , identifier }
-- Test Focus: identifier_list with 3+ identifiers — exercises the repetition
--   { , identifier } clause of the BNF. Uses multi-identifier lists in:
--   - port declarations (3 identifiers: byte0, byte1, byte2)
--   - signal declarations (2 identifiers: s_a, s_b)
--   - constant declarations (3 identifiers: C_MIN, C_MAX, C_STEP)
--   - variable declarations (2 identifiers: v_sum, v_carry)
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity multi_id_top is
  port (
    inp_a, inp_b, inp_c : in  bit_vector(3 downto 0);
    sel                  : in  integer range 0 to 2;
    out_hi, out_lo      : out bit_vector(3 downto 0);
    ovf_flag, neg_flag  : out bit
  );
end entity multi_id_top;

architecture rtl of multi_id_top is
  -- Two-identifier list in signal declaration
  signal s_reg_a, s_reg_b : bit_vector(3 downto 0);

  -- Three-identifier list in constant declaration
  constant C_ZERO, C_ONE, C_MAX : bit_vector(3 downto 0) := "0000";

  -- Two-identifier list in another signal
  signal s_sel_prev, s_sel_curr : integer range 0 to 2 := 0;
begin
  process(inp_a, inp_b, inp_c, sel, s_reg_a, s_reg_b)
    -- Two-identifier list in variable declaration
    variable v_tmp_a, v_tmp_b : bit_vector(3 downto 0);
  begin
    v_tmp_a := inp_a;
    v_tmp_b := inp_b;

    case sel is
      when 0 =>
        out_hi <= v_tmp_a;
        out_lo <= C_ZERO;
      when 1 =>
        out_hi <= v_tmp_b;
        out_lo <= inp_c;
      when 2 =>
        out_hi <= inp_c;
        out_lo <= v_tmp_a;
      when others =>
        out_hi <= C_MAX;
        out_lo <= C_ONE;
    end case;

    s_reg_a    <= v_tmp_a;
    s_reg_b    <= v_tmp_b;
    s_sel_curr <= sel;
    s_sel_prev <= s_sel_curr;
  end process;

  ovf_flag <= '1' when s_sel_prev /= s_sel_curr else '0';
  neg_flag <= '0';
end architecture rtl;
