-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Positive
-- Test Focus: Exercises subtype_declaration with array subtype constraining a slice for a PID controller.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity subtype_decl_syn4 is
  port (
    clk     : in  bit;
    error   : in  integer range -128 to 127;
    control : out integer range -512 to 511
  );
end entity subtype_decl_syn4;

architecture rtl of subtype_decl_syn4 is
  subtype t_error is integer range -128 to 127;
  subtype t_control is integer range -512 to 511;
  constant C_KP : integer := 2;
  constant C_KI : integer := 1;
  signal s_error    : t_error   := 0;
  signal s_integral : t_control := 0;
  signal s_control  : t_control := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_error <= error;
      s_integral <= s_integral + s_error;
      s_control <= (s_error * C_KP) + (s_integral * C_KI);
      control <= s_control;
    end if;
  end process;
end architecture rtl;
