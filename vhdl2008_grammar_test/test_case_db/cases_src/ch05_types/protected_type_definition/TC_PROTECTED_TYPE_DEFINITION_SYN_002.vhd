-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DEFINITION_SYN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_definition ::=
--   protected_type_declaration | protected_type_body
-- Test Focus: Complete protected type definition with
--   multiple methods including impure functions. The
--   declaration and body together form the full type
--   definition exercised via a shared variable.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_def_multi_method is
  port (
    clk   : in  bit;
    state : out bit
  );
end entity pt_def_multi_method;

architecture rtl of pt_def_multi_method is
  type t_switch is protected
    procedure turn_on;
    procedure turn_off;
    impure function is_on return bit;
  end protected;
  type t_switch is protected body
    variable v_on : bit := '0';
    procedure turn_on is begin v_on := '1'; end procedure;
    procedure turn_off is begin v_on := '0'; end procedure;
    impure function is_on return bit is begin return v_on; end function;
  end protected body;
  shared variable sv : t_switch;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.turn_on;
      state <= sv.is_on;
    end if;
  end process;
end architecture rtl;
