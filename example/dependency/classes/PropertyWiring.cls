/**
 * @description
 * Example of property wiring.
 *
 * @author Mark Brennand
 */
public with sharing class PropertyWiring {

    // Setup a default registry. The default registry will take the Map to assign to the 'properties' member
    // variable from the DefaultConfiguration class.
    static {
        Dependency.bind(Map<String, Integer>.class, 'animals', DefaultConfiguration.class);
    }

    // The member variable 'properties' value is injected into the class on construction.
    public final Map<String, Integer> properties =
            (Map<String, Integer>) Dependency.inject(Map<String, Integer>.class, 'animals');


    /**
     * @description
     * Call this method using anonymous APEX to see the value assigned to 'properties' on construction.
     */
    public static void run() {
        PropertyWiring wiring = new PropertyWiring();
        System.debug('The farm has ' + wiring.properties.get('sheep') + ' sheep');
        System.debug('The farm has ' + wiring.properties.get('cows') + ' cows');
        System.debug('The farm has ' + wiring.properties.get('hens') + ' hens');
    }

    /**
     * @description
     * Default configuration values.
     */
    public class DefaultConfiguration implements TypeHelper.Factory {
        public Object newInstance() {
            return new Map<String, Integer> { 'sheep' => 100, 'cows' => 50, 'hens' => 2000 };
        }
    }

    /**
     * @description
     * New configuration values.
     */
    public class NewConfiguration implements TypeHelper.Factory {
        public Object newInstance() {
            return new Map<String, Integer> { 'sheep' => 1, 'cows' => 2, 'hens' => 3 };
        }
    }
}
