-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PROTECTED_TYPE_BODY
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Test Focus: Production-specific: full protected body with
--   procedure + impure function, variable initializer, and
--   optional trailing type name. Exercises all three syntactic
--   elements of the production together.
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_syn_s01 is
  port (
    clk   : in  bit;
    phase : out natural
  );
end entity pt_body_syn_s01;

architecture rtl of pt_body_syn_s01 is
  type t_walker is protected
    procedure advance;
    impure function pos return natural;
  end protected;
  type t_walker is protected body
    variable v_pos : natural := 1;
    procedure advance is
    begin
      if v_pos < 64 then v_pos := v_pos * 2; end if;
    end procedure;
    impure function pos return natural is
    begin
      return v_pos;
    end function;
  end protected body t_walker;
  shared variable sv_w : t_walker;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv_w.advance;
      phase <= sv_w.pos;
    end if;
  end process;
end architecture rtl;
