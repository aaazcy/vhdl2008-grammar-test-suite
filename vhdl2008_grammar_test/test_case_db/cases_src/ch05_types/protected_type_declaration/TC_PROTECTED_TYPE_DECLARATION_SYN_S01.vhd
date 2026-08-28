-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PROTECTED_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Test Focus: Production-specific: protected declaration with
--   two procedures, one impure function, attribute_specification,
--   and optional trailing name. Exercises all syntactic elements
--   of the declaration production in one type.
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_decl_syn_s01 is
  port (
    clk     : in  bit;
    running : out bit
  );
end entity pt_decl_syn_s01;

architecture rtl of pt_decl_syn_s01 is
  attribute attr_label : string;
  type t_timer is protected
    procedure start(ticks : natural);
    procedure stop;
    impure function expired return bit;
    attribute attr_label of start : procedure is "start_timer";
  end protected t_timer;
  type t_timer is protected body
    variable v_remaining : natural := 0;
    variable v_active    : bit := '0';
    procedure start(ticks : natural) is
    begin v_remaining := ticks; v_active := '1'; end procedure;
    procedure stop is
    begin v_active := '0'; v_remaining := 0; end procedure;
    impure function expired return bit is
    begin
      if v_active = '1' then
        if v_remaining = 0 then return '1';
        else v_remaining := v_remaining - 1; return '0'; end if;
      end if;
      return '0';
    end function;
  end protected body t_timer;
  shared variable sv : t_timer;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.start(5);
      running <= sv.expired;
    end if;
  end process;
end architecture rtl;
