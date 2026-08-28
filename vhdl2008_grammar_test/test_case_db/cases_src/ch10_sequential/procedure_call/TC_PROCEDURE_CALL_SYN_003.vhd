-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Production: procedure_call ::= procedure_name [ ( actual_parameter_part ) ]
-- Case Type: Positive
-- Test Focus: named association call: `set_color(red => 255, green => 128, blue => 0);` — named association using formal name => actual
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_call_named_ent is
  port (
    r : in  integer range 0 to 255;
    g : in  integer range 0 to 255;
    b : in  integer range 0 to 255
  );
end entity proc_call_named_ent;

architecture named of proc_call_named_ent is
  signal s_r, s_g, s_b : integer range 0 to 255 := 0;
begin
  process(r, g, b) is
    procedure set_rgb(
      red   : in integer range 0 to 255;
      green : in integer range 0 to 255;
      blue  : in integer range 0 to 255
    ) is
    begin
      s_r <= red;
      s_g <= green;
      s_b <= blue;
    end procedure;
  begin
    set_rgb(red => r, green => g, blue => b);  -- named association
  end process;
end architecture named;
